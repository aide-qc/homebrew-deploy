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
    sha256 "ae7bdbbd461d1da33b73c3d960eafac15b01d08e8045b81983f447b6fb3edc1e" => :mojave
    sha256 "270e8640c7c6d393ce8edca4b0adce6d65cc397e35bdf3aa79e92112f0444621" => :catalina
    sha256 "852173f23c29133de5e2ec568e1c039b25f7293859585f820c4833edbf0b29ca" => :x86_64_linux
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
