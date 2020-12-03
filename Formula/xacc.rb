class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "1eedc95f25b286055efa027e9f9521c777bb7e707d12a140e26c47a8147a780f"                                        
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
    sha256 "57350ba54121655d975ae0c8814ab6bc5150fa6903cccb14d7d40ea028b21aad" => :x86_64_linux                           
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
