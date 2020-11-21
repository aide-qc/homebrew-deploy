class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "b60a34f16aba7cfd6cd60dd1988772a5818f4afff664a77e35cb5cda2e2b65d6"                            
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "b1975cb7183d90af2f823aa2f78b0e559bd35937fcaa78aa3bc512b1a223ffeb" => :mojave
    sha256 "2324056802814251092fdf916a96c3a6c04e612d4843747c90d76fd2de23af20" => :catalina
    sha256 "74f09deb1ee7e82f66898a477cd3c250bc5b39e040f8fa0a50447ced53abe481" => :x86_64_linux                  
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
