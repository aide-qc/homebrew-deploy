class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "515e1f573b48224cbc935bf9d72cf97e79db561482ecff26f997a400254f1e63"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "0918273a5340b3e5ad965fb512791de75a1490dd3206ff7f1e1bf063016f8658" => :mojave
    sha256 "cb9a5dfdc7404e1eac74e9970d0f77fd761ce4c780fd67e6d92e434f13f6e957" => :catalina
    sha256 "d2b34b271ded5fcde2f410da2e67d9a238e2ebc6d630cfcf33a684764b011cb6" => :x86_64_linux
  end

  def install
    args = %W[
      -DCMAKE_BUILD_TYPE=Release
    ]

    xaccpath = buildpath
    mkdir xaccpath/"build" do
       system "cmake", "..", *(std_cmake_args + args)
       system "cmake", "--build", ".", "--target", "install"
    end
  end

end
