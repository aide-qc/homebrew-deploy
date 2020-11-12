class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "380b37ba10b766376343d38e9cf81fa7c03b9d036827fa0f9244cbcc7637be85"                  
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
    sha256 "545dc9b468f6ba7c364e800c55cf008ae585ca1082b8b3e000e3b8ab00b0f186" => :x86_64_linux         
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
