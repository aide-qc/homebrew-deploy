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
    sha256 "510d40eabdce2ae6874980fc1036b69eb2ef0e3d2f77135f686a850a52034cbf" => :mojave
    sha256 "8a8abcf00add2fd67b205c8943a90bf349462514196b4af21b7ff80d73c726bc" => :catalina
    sha256 "f7440f0a6457c21290a7e506dd24c929a5bd9b849b25081e02f2c338ccbd4826" => :x86_64_linux
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
