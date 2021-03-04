class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "13f02fff418bb5d7a9f726d7693ee8a45530e958eabed7b553628e66c96b83f1"
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
    sha256 "decbaa6cf90724926ac39e07d337148fc3120d93e694c9eff7af05244bc24512" => :x86_64_linux
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
