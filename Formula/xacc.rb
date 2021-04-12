class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "db799a5e3af148a4e2173d2d332ee34a95f87da9ff8ed83cd65d4d1330b5fad9"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "de7a4f855a76143d7834b821dda9c1292ef9ef8c319685970798cf3151317f6e" => :mojave
    sha256 "508ead4f9fd9b6bd19a230936283b852774b255eeced4bcfc962b75f147b6de1" => :catalina
    sha256 "c85e205770bdb2eda52c24825a54ca796dce23fcfa9d47dcfa05599b673cf956" => :x86_64_linux
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
