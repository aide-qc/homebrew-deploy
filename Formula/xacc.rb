class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "5d419a98d8aa731d096ae2d968ebb7c00474435409047fa71f859eaf066ba9c5"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  if !OS.mac?
    depends_on "gcc@10"
  end

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "3fcc9639a83080bf8a532aae7824cf7a8f34cab95e260fefd60d2558a1551d7d" => :mojave
    sha256 "71ad80275b064d67533e0601d7ff7fc9c6e7fe522b188345faf19d4ce3cecf4d" => :catalina
    sha256 "c9338ea9d30b68ce5412da54a1964f0e83a562b38520336d8ff9d51812de639c" => :x86_64_linux
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
