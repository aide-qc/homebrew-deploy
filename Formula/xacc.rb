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
    sha256 "b723cabdba9cb2bc75ef81eb9c8f9b4d1fc896dc8234119054f82eba22d6cd12" => :catalina
    sha256 "98f6c8b965e45ee15059d9587cc4ea389f26478fbd57944a05564f200a20b169" => :x86_64_linux
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
