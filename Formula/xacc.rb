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
    sha256 "92c68c47a904ea68a5882c5d07b91daf49783fd884d612f3333b39096c1101d9" => :catalina
    sha256 "5184f06e008aaa007e50d3ea56a873f6f909410e7bd8ef1e4d952ab0cde13b08" => :x86_64_linux               
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
