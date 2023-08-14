# 現在の日時を取得
current_time = Time.now.strftime("%Y%m%d%H%M%S")

# カレントディレクトリを取得
current_dir = File.dirname(__FILE__)

# isucon.confのシンボリックリンクを削除
file "/etc/nginx/sites-enabled/isucon.conf" do
  action :delete
end

# isucon-php.confのシンボリックリンクを作成
link "/etc/nginx/sites-enabled/isucon-php.conf" do
  to ("/etc/nginx/sites-available/isucon-php.conf")
  action :create
end

# nginx.confのバックアップ
execute "backup nginx.conf" do
  command "mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.#{current_time}"
  only_if "diff -q /etc/nginx/nginx.conf #{current_dir}/config/nginx.conf"
end

# nginx.confをコピー
remote_file "/etc/nginx/nginx.conf" do
  owner  "root"
  group  "root"
  source "config/nginx.conf"
  mode   "644"
end

# isucon-php.confのバックアップ
execute "backup isucon-php.conf" do
  command "mv /etc/nginx/sites-available/isucon-php.conf /etc/nginx/sites-available/isucon-php.conf.#{current_time}"
  only_if "diff -q /etc/nginx/sites-available/isucon-php.conf #{current_dir}/config/sites-available/isucon-php.conf"
end

# isucon-php.confをコピー
remote_file "/etc/nginx/sites-available/isucon-php.conf" do
  owner  "root"
  group  "root"
  source "config/sites-available/isucon-php.conf"
  mode   "644"
end
