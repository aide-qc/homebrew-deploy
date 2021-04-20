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
    sha256 "49ac007639764a1f031c7c004ffc7b53bdc879c0c80dbecd472beb89f098289f" => :mojave
    sha256 "de75e66d4d8a784ec473613a7499e47af4bdd4b776b2fc70d6ed052ee2e2c620" => :catalina
    sha256 "99852c38cfddfd925b0fc31fde95fb82f8253b48c64b2146645a3e5cc2da26cc" => :x86_64_linux
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
