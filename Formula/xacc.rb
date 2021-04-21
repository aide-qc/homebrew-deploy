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
    sha256 "2c38e56e73082784272695d8507a3e063e642340ebe1a55d5c721e18fa5c8f7d" => :catalina
    sha256 "61992ecdd3172041520a9e752c8f60b146993b6fe9ebdc2aa7996684b8c18f37" => :x86_64_linux
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
