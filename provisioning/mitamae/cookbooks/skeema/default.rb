# skeemaに関する情報
VERSION = "1.10.1"  # version
ARCH = "arm64"      # アーキテクチャ
PLATFORM = "linux"  # プラットフォーム

URL = "https://github.com/skeema/skeema/releases/download/v#{VERSION}/skeema_#{VERSION}_#{PLATFORM}_#{ARCH}.tar.gz"
# インストールするディレクトリ
INSTALL_DIR = "/home/isucon/tools"

# ディレクトリの生成
directory INSTALL_DIR do
  action :create
end

http_request "/tmp/skeema.tar.gz" do
  url URL
  not_if "test -e /tmp/skeema.tar.gz"
end

execute "Extract Skeema archive" do
  command "tar -xzf /tmp/skeema.tar.gz -C #{INSTALL_DIR}"
  not_if "test -e #{INSTALL_DIR}/skeema"
end
