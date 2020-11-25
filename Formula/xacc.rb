class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "2c03465c05435761048f9be85a15f1fe0ceb7cd3d62d25c4be8ad0ff7c009068"                                 
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "2db083994916702e444d0280e1907e30b01d346434cbec7f1c0c8d9fa1745224" => :mojave
    sha256 "387185450d2e50e290a1e244c44655fd8fa5b779ff4cd6a289122c58c531d8f5" => :catalina
    sha256 "7532e39003140b3227225b28511e9afaa2d22184a79e2217f73eb43279419566" => :x86_64_linux                     
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
