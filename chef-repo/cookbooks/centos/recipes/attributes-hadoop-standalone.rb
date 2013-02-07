processor_count = `cat /proc/cpuinfo | grep processor | wc -l`.chomp.to_i

node.set["variables"] = {
  "hadoop_config" => {
    "masters" => [node[:hostname]],
    "slaves" => [node[:hostname]],
    "core-site.xml" => {
      "fs.default.name" => "hdfs://#{node[:hostname]}:8020",
      "webinterface.private.actions" => "true",
      "hadoop.tmp.dir" => "/var/lib/hadoop-0.20/cache/${user.name}",
      "io.compression.codecs" => "org.apache.hadoop.io.compress.GzipCodec,org.apache.hadoop.io.compress.DefaultCodec,org.apache.hadoop.io.compress.BZip2Codec"
    },
    "hdfs-site.xml" => {
      "dfs.name.dir" => "${hadoop.tmp.dir}/dfs/name",
      "dfs.data.dir" => "${hadoop.tmp.dir}/dfs/data",
      "dfs.replication" => 3,
      "dfs.permissions" => "false",
      "dfs.datanode.max.xcievers" => 2048      
    },
    "mapred-site.xml" => {
      "mapred.job.tracker" => "#{node[:hostname]}:8021",
      "mapred.map.tasks.speculative.execution" => "false",
      "mapred.tasktracker.map.tasks.maximum" => processor_count * 3 / 2,
      "mapred.tasktracker.reduce.tasks.maximum" => processor_count,
      "mapred.userlog.retain.hours" => 1,
      "mapred.task.timeout" => 1800000
    }
  }
}
