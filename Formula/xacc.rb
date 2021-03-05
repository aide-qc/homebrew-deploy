class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "dc398800f3ad2efe34b128da3d4d263b9b7bdee62de92ffb14a9e1bd7579bf5f"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  if !OS.mac?
    depends_on "gcc@10"
  end

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "46640893da4a3fe866bcf1e2108000573838a6f7dd55a2a724a0ccc879533388" => :mojave
    sha256 "fc7297be2cbe0b0a4d096afb839bdd4dc27d1d33ce647dbceab857ec359fbfc6" => :catalina
    sha256 "7ef5735f864da4a3b70a63cade1cb2d2aa10660e96a0866f23f57243aeb510b8" => :x86_64_linux
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
