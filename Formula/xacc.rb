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

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "e9ff0f1280b49f972cf4cef1c3e7913804db3d0c3aaea1fcb5c6cf98d75948b3" => :mojave
    sha256 "48ccf378e8cc81075819e32ab75b3fb74f94dc0458f9d3dc61ba928041bd0879" => :catalina
    sha256 "c67ef8bc5530bb4a1bcd0c9ceab6cc42ea3658b2f375779671798dffac5f6523" => :x86_64_linux
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
