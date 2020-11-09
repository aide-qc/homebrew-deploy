class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "d3b8b4fc9b02f5ce36ba75646d628d549b91540ef25f76c494e1968bc5ff1bec"              
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "c18d9306235da6251776ffbc5076dfdf73498b60ea51edbb0a21c4513dbbae7a" => :mojave
    sha256 "9fdede5d4f4b1990dc4e92baa7f4d0796f9fb4918e0c778da7e80d4bcf62ee6a" => :catalina
    sha256 "4cbd16e1a5aae77588be8c0368038e7a8ca871f88345f927f693d83480368d79" => :x86_64_linux     
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
