class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "31237bf0f643b2989d84dbae1d906d20cebe077d89c56aecf42896e1110c7023"                                                   
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "ad714add56983ffbabe0975a08dfbac32bbe6eb156f2bd00f1451645d52c1e0e" => :mojave
    sha256 "125e2830eb62a46663c63de0253c0e5f61fd6f213e44a7d126edb62168373c66" => :catalina
    sha256 "a42dc226771cbe4fd1ed6ffc355ef7dcdda7c35125eb1cf3e5250d42dc25b6d4" => :x86_64_linux                                                                    
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
