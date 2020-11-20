class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "8745f0e09302db1e7b80f963926a1b1e1ecc2722c2cf32e0207a1675faca80c0"                           
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "3a299da2b644530605a0abad5be34d78bd82fc5297718170430955b3473fc7d6" => :mojave
    sha256 "34155ca3d37b8b15cf2e13ff2f026891610af3558792ab590bc7079e33a1d104" => :catalina
    sha256 "b681ec6d55280adad00e40f1fbc2c8008b174ef554836667b2d4acb4aafa83d7" => :x86_64_linux                  
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
