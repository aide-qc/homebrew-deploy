class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "8c67ab1bc9c8d15e6e1345ba640487da2198b824c3ef1b87cefb94461bcb2df5"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "04d3f96ddd74b0bacf83788d6374bd4d8746b5a798e57093b4612441acd1bd74" => :mojave
    sha256 "da90825f7fd3db81640f30ea5bcee699719559444ae2b0bc96e5a8875d70ae5e" => :catalina
    sha256 "b9058c294e45b91b1c9a9c054301c19ee3e2c290af6ead17176721b184911324" => :x86_64_linux
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
