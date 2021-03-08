class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "22812d17e0f7486b4dd63f21164dc72a4230fe0acdd8ed38deafb98850db00a0"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "20012b7216c932930547db4abf486d63b7fb749f31b133673029e73536dbb5ce" => :mojave
    sha256 "2e51a3c82b27d0d47ab7b79103a864457308c5517c7e4805c14323337380b44f" => :catalina
    sha256 "9b17e6b962af1b7ac17aab7ff9d966ea514d22621679ed7e0a75eb3927b554a6" => :x86_64_linux
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
