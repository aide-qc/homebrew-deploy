class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "e844d13f9ec6abb26e57e0bd25854e560849b89926c4c25c1ee3c0ebdcd9b07d"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "d0ac028ad3298cf9e82afb9c0857397d93854e2b2153877bf6bd88192d27ed50" => :mojave
    sha256 "d8498be9c080d5046a0f8eaf1722adba57318ba8fdf75b4d4735ea37c3538f51" => :catalina
    sha256 "bbbe0fe53e1ee9ebd52111ed44f901dd81ecc411ca62569486ef1d09853be689" => :x86_64_linux
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
