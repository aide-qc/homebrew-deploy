class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "7b1d3e28d21adb785e565ca157874ac0bb94fc818e4e41ae22356d91e8d16ef9"                   
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "c1f36c050e4911d4666c7e3073fffc338a49f56adfc39b08f3947204a8e9ee3d" => :mojave
    sha256 "8aa6746c7f55c3f9d1f58bfbbe049356d6fa41e4ebd279c5496a64943913c738" => :catalina
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
