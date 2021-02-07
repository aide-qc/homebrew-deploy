class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "c178f36e19c79ea72b6c7d7ae8e0ccf9bf7417a72f5e7770458cad53fe6e6ba3"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  if !OS.mac?
    depends_on "gcc@10"
  end

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "f7bc074bbc356bf96437cc652016ae02f550e9d2b212157a140520e0da68d3a1" => :mojave
    sha256 "47e7d31566963af2a68b6ff87fed65e38e624aed1c72ac38d57d86886ba84f1f" => :catalina
    sha256 "440cf32ad4a18c7b4cb8163266980ed2a3254765eb7c11d6cbac66adda04c098" => :x86_64_linux
  end

  def install
    args = %W[
      -DCMAKE_BUILD_TYPE=Release
    ]

    xaccpath = buildpath
    mkdir xaccpath/"build" do
       system "cmake", "..", *(std_cmake_args + args)
       system "cmake", "--build", ".", "--target", "install"
    end
  end

end
