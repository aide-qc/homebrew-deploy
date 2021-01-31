class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "7466302f5888328387880546ffc5ac0a30733938e0b894c32ebe94dbfe956c21"
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
    sha256 "92cf42e53710554b7772c231d8ce2bf31d15b9e5675b6755e42eb6b88244ceec" => :mojave
    sha256 "dc558a2e5781d80be6313de576052d5d3c5295ed82f7128c878014db50a04336" => :catalina
    sha256 "f52978d8537f5697e4ccc755e535e629a7bfd1f6e5757d4239f79666479b0882" => :x86_64_linux
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
