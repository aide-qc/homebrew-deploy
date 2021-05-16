class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "d8a36a63f655eb897fefd868cb98f8fd84e699b8508a0aba5c46f0dbd747624a"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "4ee7b999d78c46262a8d801e95d6ae71c3869647124f174984f4de4340c60509" => :mojave
    sha256 "611cb41c628a3b6577e8562f04ee96970f3ebb619116c3d317aa59c0b47b080e" => :catalina
    sha256 "ac95bbbd81718060af40e94d7f6d61013f7972ae92f50276c63fdaf462c2baf6" => :x86_64_linux
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
