TOOLS_DIR = "/home/isucon/tools"
MYSQL_LOG_BASE_DIR = "/var/log/mysql"
MYSQL_LOG="#{MYSQL_LOG_BASE_DIR}/mysql-slow.log"
NGINX_LOG_BASE_DIR = "/var/log/nginx"
NGINX_LOG = "#{NGINX_LOG_BASE_DIR}/access.log"
TIMESTAMP = `date "+%Y%m%d_%H%M%S"`.strip

# MySQLのslow-query.logを解析
execute "Analyze mysql slow-query log with pt-query-digest" do
  command "pt-query-digest #{MYSQL_LOG} > #{MYSQL_LOG_BASE_DIR}/pt-query-digest.log.#{TIMESTAMP}"
  only_if "test -f #{MYSQL_LOG}"
end

# nginxのaccess.logを解析(avg)
execute "Analyze nginx access log with alp" do
  command "#{TOOLS_DIR}/alp json --sort avg -r -m '/posts/[0-9]+,/@[a-z]+,/image/[0-9]+\.[a-z]+' -o count,method,uri,min,avg,max,sum --file #{NGINX_LOG} > #{NGINX_LOG_BASE_DIR}/nginx-alp-avg.log.#{TIMESTAMP}"
  only_if "test -f #{NGINX_LOG}"
end

# nginxのaccess.logを解析(sum)
execute "Analyze nginx access log with alp" do
  command "#{TOOLS_DIR}/alp json --sort sum -r -m '/posts/[0-9]+,/@[a-z]+,/image/[0-9]+\.[a-z]+' -o count,method,uri,min,avg,max,sum --file #{NGINX_LOG} > #{NGINX_LOG_BASE_DIR}/nginx-alp-sum.log.#{TIMESTAMP}"
  only_if "test -f #{NGINX_LOG}"
end
