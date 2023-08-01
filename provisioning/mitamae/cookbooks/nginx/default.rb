# isucon.confのシンボリックリンクを削除
file "/etc/nginx/sites-enabled/isucon.conf" do
  action :delete
end

# isucon-php.confのシンボリックリンクを作成
link "/etc/nginx/sites-available/isucon-php.conf" do
  to "/config/sites-available/isucon-php.conf"
  force true
  action :create
end