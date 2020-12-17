class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "b5e917d6e2dffcd04a2b9b23561840bae5e85cae96623dcbd88e524a9c585783"                                             
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "8b0f0282386356bf25301c6260dd91c3ce68b246a7afb904b248ec20fcc21729" => :mojave
    sha256 "f77e24acaa4367644b175c80f6838b5c70772191499786c002f65ac217ab43eb" => :catalina
    sha256 "4118834e1d736799c2dff525e14bf3c6d181c5978ed873299ea87cb64bdc2f5a" => :x86_64_linux                                          
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
