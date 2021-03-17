class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "1d3175f0ddfdc20c8712126bf0cf03f60c1a14a4a522f974f639e728499f95a7"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "5cc75153b81d3848533ee0fbfb1fb8a95766d8783069c9556d9e96ddfb1defbd" => :mojave
    sha256 "778f591ebd9daa4da4fe2e7bedfd7d8678f19c340a96b3e0c4f26f23228eb303" => :catalina
    sha256 "fc0c0baa5fdb30a56e5312afa1d73a13e328d977b3390d928c2ffdd0eb9d84d9" => :x86_64_linux
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
