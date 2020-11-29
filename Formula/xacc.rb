class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "e68265e8f5162f1f814fa743f9c6cbac3e12816d880329532e4581656cdcd8fc"                                   
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
    sha256 "9a0d5dfd064642dabf79672dc5c6824c56d5f47860b6d111a9923c7d4297bc96" => :catalina
    sha256 "68299273975a76c347a24f57d8d3e50813fda4511a09d1ad1551f5ffa78607de" => :x86_64_linux                          
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
