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
    sha256 "eab3684018ff5c7f4196d3b1ceebc43169ffcc7f4a91c0446d926b042e4aee8e" => :mojave
    sha256 "40e140fd020ee3b82ebd7b25e3e0b8474462b020f0bfa357727903179ceabdc5" => :catalina
    sha256 "128f4cf676dbfd3270c8f5bf661535299e08c7e39689be9a1d017497989785ce" => :x86_64_linux
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
