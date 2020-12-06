class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "86dd499932b9ef22114385c8b480306b3c39800a91f9768aa59b9268f262fd76"                                          
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "7c6655708bde973d5a649befa4982e91a7a2e0b03e6acb4f3c68a2f279434fca" => :mojave
    sha256 "3a198e056513230ff6dbec074059430c4a25cd63226627f7f9f49608f200a9a4" => :catalina
    sha256 "4ee9f3ddf3f386a9df8913d92fa63e8b9dc9b5f1c75be30937761b136c15ef17" => :x86_64_linux                              
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
