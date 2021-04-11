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
    sha256 "d1be0ab75be3bfef6d16dbbd3d8461fecb26afe8320fe25f05c1396e8a0ccadd" => :catalina
    sha256 "7dbc1bb4337985abc0fcbf8f6358f6841898c5b701d40a9d3b7f34d602841efd" => :x86_64_linux
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
