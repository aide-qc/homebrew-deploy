class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "b245e75015de0da39227268c00988d0c9c6721dd5ea4255d860f75b14678ff0c"                                           
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "b95c0a9645429ebb02d40fe7e37dc4ec0fe46a28a20acd15b6afccaba88ea83f" => :mojave
    sha256 "b07e816878565c118fedc1a73845473d2eb2eaa1c1a89ec2cdcf75f839b6a426" => :catalina
    sha256 "4708a8a8913d888598df8e303fa5aee251e8328f322de355748ebbabf5247ca4" => :x86_64_linux                                   
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
