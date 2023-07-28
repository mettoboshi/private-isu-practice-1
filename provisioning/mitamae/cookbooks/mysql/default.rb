remote_file "/etc/mysql/mysql.conf.d/mysqld.cnf" do
  owner  "root"
  group  "root"
  source "config/mysql.conf.d/mysqld.cnf"
  mode   "644"
end