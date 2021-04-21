class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "37614add99522d8e3d87c2a92066fba38d5214f6222fcf9c2004c49bba2b06f4"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "d7d8ff0e8e79d3859fdaacde3d53da00ca238753d6fed271f411480057096341" => :mojave
    sha256 "2643c015162eee1badb293f1278ee4b3aa23710077f265cead8a765f806604dd" => :catalina
    sha256 "1642959395867a648b84990a1d53b53d7ecb02d768e866f3b2a86230b62d062f" => :x86_64_linux
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
