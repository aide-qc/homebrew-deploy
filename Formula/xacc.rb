class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "e844d13f9ec6abb26e57e0bd25854e560849b89926c4c25c1ee3c0ebdcd9b07d"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "6e4053896893f66bfb2ee680c74572922ea44a5ecf88507003263a96d5c3b7fc" => :mojave
    sha256 "002a4947bec66dfe58fbaaf15e335868d011cea0c8b2bc095b149b080ff241fc" => :catalina
    sha256 "de8016c00e5f1512a233321834ce93a72cc616eae3c32cf574a055b3ac518f3d" => :x86_64_linux
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
