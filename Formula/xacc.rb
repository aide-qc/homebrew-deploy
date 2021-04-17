class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "d406cd9215a0bf5ae5825355dd1333b8f645746bd37438baf9a7617d4b700938"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "23b7f13751381bb9e06dad98d494a6933598129631d575552a1f224d5de4443c" => :mojave
    sha256 "d4f254111c05ba12f57a5919bfb8bc5399c5bbad732e45df5c49622887df2a78" => :catalina
    sha256 "a3138543e40858f14dbf31d481ab1e54e362d768b49c5a9e70dd65d912cec3c4" => :x86_64_linux
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
