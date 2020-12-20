class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "b5e917d6e2dffcd04a2b9b23561840bae5e85cae96623dcbd88e524a9c585783"                                             
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "6b501a21e5f9c9aff2dc5ca043735ef4abd3bd39afec8e107806d989e9e0d963" => :mojave
    sha256 "29f2c2e9f9998a6cf2998a0c488be6a9d6ed32aa7aa73c752fb693e6e7cd4018" => :catalina
    sha256 "0e73cfd7b01b1231a7aa7ad17716fe8c76795550e9db9dc8c14b17ffc3e1ba68" => :x86_64_linux                                             
  end

  def install
    args = %W[
      -DCMAKE_BUILD_TYPE=Release
      -DCMAKE_CXX_COMPILER=g++-10
      -DCMAKE_C_COMPILER=gcc-10
      -G Ninja
    ]

    xaccpath = buildpath
    mkdir xaccpath/"build" do
       system "cmake", "..", *(std_cmake_args + args)
       system "cmake", "--build", ".", "--target", "install"
    end
  end

end
