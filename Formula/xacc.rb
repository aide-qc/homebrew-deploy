class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "c178f36e19c79ea72b6c7d7ae8e0ccf9bf7417a72f5e7770458cad53fe6e6ba3"
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
    sha256 "60c18118ac85b25c3fbf09aff0c73f2dd1b222df5eefbe29b1fb210200da3ee0" => :mojave
    sha256 "058f8d0051e45028c4c6804c155085b631d3227bf6ff2f4ef71b6295c13e2a11" => :catalina
    sha256 "88bc3592cdc417398509264b838b5b1795fcb334200908a6ecee81e15e0ed7bf" => :x86_64_linux
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
