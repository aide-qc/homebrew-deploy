class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "663f3f1b60325bb4404b88c168b4e3cdfbac362649572f15171375b38bdf18e3"                     
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "ceb6614f2f7083bb3f53c55ae6e8584a25869c21294b78677951bda7d123c65c" => :mojave
    sha256 "2ddd50e4f070078ec68a86875db0e3a8c3ba0992c632fe9b37b956ad068a0953" => :catalina
    sha256 "9704cab776fc2a4a8d2c29dc7315a6a11a3b59c16a905f88d00d0f659b4a77b6" => :x86_64_linux              
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
