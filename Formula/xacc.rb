class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "5d419a98d8aa731d096ae2d968ebb7c00474435409047fa71f859eaf066ba9c5"
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
    sha256 "3fcc9639a83080bf8a532aae7824cf7a8f34cab95e260fefd60d2558a1551d7d" => :mojave
    sha256 "77bd99077d76b81aa09c824275ffedf7e04f18a7446abf94d37d8d2d60b70929" => :catalina
    sha256 "26eeaa2c95c9f7c11277e3ddf494e7bd8e3a2ad5bdc929558e578805050d21d4" => :x86_64_linux
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
