TOOLS_DIR = "/home/isucon/tools"
MYSQL_LOG_BASE_DIR = "/var/log/mysql"
MYSQL_LOG="#{MYSQL_LOG_BASE_DIR}/slow-query.log"
NGINX_LOG_BASE_DIR = "var/log/nginx"
NGINX_LOG = "#{NGINX_LOG_BASE_DIR}/access.log"
TIMESTAMP = `date "+%Y%m%d_%H%M%S"`.strip

# MySQLのslow-query.logを解析
execute "Analyze mysql slow-query log with pt-query-digest" do
  command "pt-query-digest #{MYSQL_LOG} > ${MYSQL_LOG_BASE_DIR}/pt-query-digest.log.#{TIMESTAMP}"
  only_if "test -f #{MYSQL_LOG}"
end

# nginxのaccess.logを解析
execute "Analyze nginx access log with alp" do
  command "#{TOOLS_DIR}/alp json --sort sum -r -m \"\" -o count,method,uri,min,avg,max,sum --file #{NGINX_LOG} > ${NGINX_LOG_BASE_DIR}/nginx-alp.log"
  only_if "test -f #{NGINX_LOG}"
end
