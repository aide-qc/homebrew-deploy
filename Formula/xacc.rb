class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "fc596dfb588e4c9c790296414e0a80db0e72adf1fd56fe0a24a67e86afe4ce5c"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "4053029ff05df8c8d475f31f0f8d8be09d236450770be351b4589e0fbdd0a7f4" => :mojave
    sha256 "0ac4eb222bd454fd21d245c6b60325126453eb0c5e519cd4608a297e168517e8" => :catalina
    sha256 "6ecd9555c10c1b141bcc124aff0defb9f1d9a8d7f89f573d64aeb74514597bbb" => :x86_64_linux
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
