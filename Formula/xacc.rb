class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "58bb38372b38320fbeb7c90810f904fe616c43967873fe3993ba25166942c1ee"                                      
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "64bbbf8ce9fd75997afd5913e56e6b4e4d86b502e64b8857744a8c27abcaed32" => :mojave
    sha256 "c96ce406b10d39d71f8dd5cb7bb9767f15907c1abbf71e884c2392cbd9c11908" => :catalina
    sha256 "bf440d9c98bc1499377e8f5de0fa66607dcd90fa62679dc5a951909c2d1512fd" => :x86_64_linux                          
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
