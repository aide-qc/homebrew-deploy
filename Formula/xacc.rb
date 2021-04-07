class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "8c67ab1bc9c8d15e6e1345ba640487da2198b824c3ef1b87cefb94461bcb2df5"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "b6a5fcbe83a293fe2b9b92295d8622e0b4e0aafa083b4cce5b201fe348fea7c3" => :mojave
    sha256 "cd0f1fde6fb0e22165312791db9b1cbb0d9ab16ee2fa8e5b9ac9fae235bf1034" => :catalina
    sha256 "5f309306bbf793c5d661f3133b805c7919684e212fb5205c1294ba99c487c3bc" => :x86_64_linux
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
