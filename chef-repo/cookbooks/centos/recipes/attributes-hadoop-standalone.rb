node.set["variables"] = {
  "hadoop_config" => {
    "masters"=>[node[:hostname]],
    "slaves"=>[node[:hostname]],
    "core-site.xml" => {
      "fs.default.name"=>"hdfs://#{node[:hostname]}:8020",
      "hadoop.tmp.dir"=>"/var/lib/hadoop-0.20/cache/${user.name}",
    },
    "hdfs-site.xml" => {
      "dfs.replication" => 2,
      "dfs.name.dir" => "/var/lib/hadoop-0.20/cache/name",
      "dfs.data.dir" => "/var/lib/hadoop-0.20/cache/${user.name}/dfs/data"
    },
    "mapred-site.xml" => {
      "mapred.job.tracker" => "#{node[:hostname]}:8021",
      "mapred.map.tasks.speculative.execution" => "false",
      "mapred.tasktracker.map.tasks.maximum" => node[:cpu].size,
      "mapred.tasktracker.reduce.tasks.maximum" => node[:cpu].size,
      "mapred.userlog.retain.hours" => 1
    }
  }
}
