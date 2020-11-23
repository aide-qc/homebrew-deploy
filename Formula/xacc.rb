class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "a599cea756d54cca70a0270a5d6f278110ccef4f86bd1f289e1743be00849a02"                             
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "3a7279e9302604bfb33285180445a10b2dca10f350b58033c337785edda85e17" => :mojave
    sha256 "86f5f87160b676e6710078eedee607d218054f222827783fe02ac4a40995fafb" => :catalina
    sha256 "9106c4cf1fe239ede989061cdd93c1de680a8629f44b0beb00832d7170e3b529" => :x86_64_linux                    
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
