# isucon.confのシンボリックリンクを削除
file "/etc/nginx/sites-enabled/isucon.conf" do
  action :delete
end

# isucon-php.confをコピー
remote_file "/etc/nginx/sites-available/isucon-php.conf" do
  owner  "root"
  group  "root"
  source "config/sites-available/isucon-php.conf"
  mode   "644"
end

# isucon-php.confのシンボリックリンクを作成
link "/etc/nginx/sites-enabled/isucon-php.conf" do
  to ("/etc/nginx/sites-available/isucon-php.conf")
  action :create
end