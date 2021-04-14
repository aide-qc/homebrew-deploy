class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "4cb5e90f7ffcdd21a137403f8b07ef5e156673f854e89e08733dece76d792980"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "fdeb1f6dccb5bbbf18d85a5cef87e28ae913dca4d6918b02c232d4ef6cdf7b70" => :mojave
    sha256 "3a521c0b12fcaf3c7d6aa96ea033bb81705df60688a30cb936adbed972c8a4c4" => :catalina
    sha256 "ea9d34bd3c6d072966e7df887e74f0366a7831b9fa29cee68c2274b6fbf8594f" => :x86_64_linux
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
