class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "b7f87b207fbf31dbcb7497d334548e88b00bd0afaf38758ff7710fb7a798335f"                               
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
