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
    sha256 "26a0eb1f1f5bfec742f952635fd97f7f28ec1b9cc93b43c9f1d49875b4d2b03a" => :mojave
    sha256 "20148db93190283c6731a28d1db1186338ae5dd9374483c8425b14ad481fce23" => :catalina
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
