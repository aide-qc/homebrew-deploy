class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "f9411dfd281665a37474e58671965340350d32333c06ad6ab92782730e33552c"                    
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
    sha256 "2ddd50e4f070078ec68a86875db0e3a8c3ba0992c632fe9b37b956ad068a0953" => :catalina
    sha256 "c28d5deb1d43ff9bbf682bad756de620223ddfd985b99011089a8562d5cfc76b" => :x86_64_linux            
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
