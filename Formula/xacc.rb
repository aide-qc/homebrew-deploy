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
    sha256 "095dbe6b4d81116d1fca36a3ce9294bf30f4598efc4b0b5795a71d33820fa67e" => :mojave
    sha256 "f9f837cdb1d535a6de83c56a216b923c465511225d318f4683e0c03b6f5a64bb" => :catalina
    sha256 "b4e9137b54f3c0bf9c79321f9e85e2ae56a0eb9e8ed655a8980d66c623998b91" => :x86_64_linux
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
