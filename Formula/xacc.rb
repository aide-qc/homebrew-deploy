class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "1031c9268f17e56a66f766fe0c03ddb1e354040334762ac9a46a124b24dfa84e"                
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "a403efad46603f747b4b991fd24621e57c6bd3c2d3ae4e013eabc2efd73638a0" => :mojave
    sha256 "4c8af2b072e6475391a32824edad289b08f159ac75ec444134ef2297fcece04a" => :catalina
    sha256 "3a135e47e4e96afa363066d735af2491424238e94f2975a170794d34c11206b6" => :x86_64_linux        
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
