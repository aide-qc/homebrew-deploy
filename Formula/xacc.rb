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
    sha256 "28e5459adc86ffb723ba29fbcb8d3c7807bc2b32d75b7a31dcb4237d366b3a3c" => :mojave
    sha256 "463680a14930118232949f9ee4e5967fa0c1254b0fe116ba854b9d76de507e57" => :catalina
    sha256 "565334eff9685399b5bf9815e55e8586dec44594b361fdfbff93af219138a39a" => :x86_64_linux
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
