MYSQL_LOG = "/var/log/mysql/mysql-slow.log"
NGINX_LOG = "/var/log/nginx/access.log"
current_time = `date "+%Y%m%d_%H%M%S"`.strip

# MySQLログファイルの移動
execute "Move MySQL slow query log" do
  command "sudo mv #{MYSQL_LOG} #{MYSQL_LOG}.#{current_time}"
  only_if "test -f #{MYSQL_LOG}"
end

# nginxログファイルの移動
execute "Move nginx access log" do
  command "sudo mv #{NGINX_LOG} #{NGINX_LOG}.#{current_time}"
  only_if "test -f #{NGINX_LOG}"
end

# MySQLの再起動
service "mysql" do
  action :restart
end

# Nginxの再起動
service "nginx" do
  action :restart
end
