class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "b696f0b907cd5b50d3c7ad80f61fb8c2d616e8f261283aa6bccde70a98fb5c2d"                                            
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "586e4c97bfdfd47babaf291685f3c38a59a95a71e042b52f36cb5489e964acdc" => :mojave
    sha256 "b04eb991b450405a443dbee9369dddb0f26d07e0033135586b737ed2c6b4c566" => :catalina
    sha256 "c724730bab1a558c6dc8c9abd58435be240fb01af54101b92ed17a9af3f63c48" => :x86_64_linux                                       
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
