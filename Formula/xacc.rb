class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "b7988a602b6bc24c5684c63bf03906bba42e3e6fa904f4b476e3c3250a931004"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "eb0d83eb8b3f1de5face16165bdb71eb39d1309bd9d30aa1858333590ff464fc" => :mojave
    sha256 "24ec0b80081a2b21f12709fb85f995dbcb8e72c88584cc1aab2407affb266efd" => :catalina
    sha256 "99852c38cfddfd925b0fc31fde95fb82f8253b48c64b2146645a3e5cc2da26cc" => :x86_64_linux
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
