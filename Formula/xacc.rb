class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "9d34afa99acd4eaf03d02a978dcadab41517fa21e51488b97076c0ed9df58d4e"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "8fff7a3f0e4be0e0fe86413f6afb9d32b6e725049e8bc0b0586a43f87baee816" => :mojave
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
