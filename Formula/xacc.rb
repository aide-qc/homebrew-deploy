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
    sha256 "fe3cb1b228b7305a7e07cdfe515d66007307bbdfd8bdbe59597e217b8b2e805c" => :mojave
    sha256 "d4f254111c05ba12f57a5919bfb8bc5399c5bbad732e45df5c49622887df2a78" => :catalina
    sha256 "31bb73ce3443e5a8afdd8be5f9e817b01bcbd6e102899beb9f32c38811625ca2" => :x86_64_linux
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
