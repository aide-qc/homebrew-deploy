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
    sha256 "6d84c46bee099bf7c6327faadf78c9feb0a220d6a363f475871294e6362de9c5" => :mojave
    sha256 "b07e816878565c118fedc1a73845473d2eb2eaa1c1a89ec2cdcf75f839b6a426" => :catalina
    sha256 "f7f98bc9e78e7445dd1448baf7e707b5e0d5ddf0e40d0b157eaf84154e082d49" => :x86_64_linux                                  
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
