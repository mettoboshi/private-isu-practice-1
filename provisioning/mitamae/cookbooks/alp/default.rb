# alpのバージョンとアーキテクチャを指定
version = "1.0.14"
# arch = "linux_amd64"
arch = "linux_arm64"

# alpのバイナリをダウンロード
execute "Download alp" do
  command "wget https://github.com/tkuchiki/alp/releases/download/v#{version}/alp_#{arch}.zip -O /tmp/alp_#{arch}.zip"
  not_if "test -e /tmp/alp_#{arch}.zip"
end

# ダウンロードしたZIPファイルを解凍
execute "Unzip alp binary" do
  command "unzip /tmp/alp_#{arch}.zip -d /tmp"
  not_if "test -e /tmp/alp"
end

# alpバイナリを/usr/local/binに移動して実行権限を付与
execute "Install alp" do
  command "mv /tmp/alp /home/isucon/tools/alp && chmod +x /home/isucon/tools/alp"
  not_if "test -e /home/isucon/tools/alp"
end
