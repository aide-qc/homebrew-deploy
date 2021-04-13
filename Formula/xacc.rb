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
    sha256 "de7a4f855a76143d7834b821dda9c1292ef9ef8c319685970798cf3151317f6e" => :mojave
    sha256 "508ead4f9fd9b6bd19a230936283b852774b255eeced4bcfc962b75f147b6de1" => :catalina
    sha256 "a773ff132c33c7093ea41e891de904b569fe51fc07d844f826bd2adc34db4221" => :x86_64_linux
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
