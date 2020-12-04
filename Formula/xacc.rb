class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "aba38427d6cc2d656ab7767d7c272a161c0da666932b542f36a5ff16e8c3e45c"                                         
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "c68a51def3030ce948df91fcdde452f8379bb061b3fe4ec0377aab2707a2e123" => :mojave
    sha256 "3a198e056513230ff6dbec074059430c4a25cd63226627f7f9f49608f200a9a4" => :catalina
    sha256 "e27fe070d96e55df9c96dc1530e8d25c5a53650f1db746d57a9f8683c2eaa5e8" => :x86_64_linux                            
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
