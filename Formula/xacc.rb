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
    sha256 "86e6956500ed0c5bbf8406021d88afd0a108b7196b21c4796a99fa6336a5f165" => :mojave
    sha256 "c47c22f61771af15716a0df9fbe52381305397ce9e01166ed56914d5f37a9c3b" => :catalina
    sha256 "63b1995731f78929a7a0cead3aa646cb81436fdbd0feb4401f4051ca9256ec70" => :x86_64_linux
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
