class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "2433e1d81970e47a8279310f4ffa599464f1acd3983feb006d95c741572b320d"                                      
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
    sha256 "521fa89810bc1d0dcbc6ff45fafae2690e73040ecb26f21d0c3410e7d2edcfda" => :catalina
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
