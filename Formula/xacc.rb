class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "67576e3ca8039cabf0090229c518a1afc18e092dc3f50e80d279167ba288ae27"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "f6c30a50e7a1b263ba1a7b6dbc06ad79a81f02da277f90d1a0bff20360bffb93" => :mojave
    sha256 "849902f54da2554bd7904a0d9f537beb153c76adf0a960a2a365d75d5eb2b210" => :catalina
    sha256 "baff4e7b8e2a4928c8a33f8bc5f9785b0727a917d0990f24af6a7301dc80d308" => :x86_64_linux
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
