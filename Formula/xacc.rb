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
    sha256 "a478281ff0ce6041a8d549642d592243a67338bc4bdc6bf78566687e53903a72" => :mojave
    sha256 "3a198e056513230ff6dbec074059430c4a25cd63226627f7f9f49608f200a9a4" => :catalina
    sha256 "a738c02980b88a482a97c13f1fbf4a612e7989b5869c4fed44af33400fcc5390" => :x86_64_linux                                
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
