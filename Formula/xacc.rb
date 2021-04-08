class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "48998e581bb77bd84d7b83d8db92443022f42018c82883663b762d33cec9337b"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "ae1e95be8096a946a8ca6a8cc32cf58346173de2ad7ddb542995184e8894d550" => :mojave
    sha256 "b016609871f68cabb64ba9504441c02875b02b5c5ea8b17ede78788be8134739" => :catalina
    sha256 "43b2eaa775b31bac57cbba728051261a62eda973d79cf88fc7aa50e6c1830eca" => :x86_64_linux
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
