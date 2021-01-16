class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "863d5956770fe6b6ff442a8859dc3ab5e5de8afefcd7bafa937ab2749cbbb1f7"                                                     
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "ad714add56983ffbabe0975a08dfbac32bbe6eb156f2bd00f1451645d52c1e0e" => :mojave
    sha256 "b60d733d79a992628e797c8a40254bd907923fda3d0249c2b7759f8fce14ae54" => :catalina
    sha256 "2e4d7725da673f0bafa0b08aa7e07801d3286eea7dbd1e030779876129f69b67" => :x86_64_linux                                                                        
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
