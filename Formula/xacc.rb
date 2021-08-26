class Xacc < Formula
  desc "Quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "3f09e801fad34d41a4e8ba22445d7d0c6aaa155382677b67d117f33a7b569d2c"
  license "EPL and EDL"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 catalina: "7c9d1274c2028c6bf1475310345923791e5fbf87b6c3bb8c90b32772c73eb6bc"
    sha256 mojave: "b13bce5a35fbebd4677261adc3c5f4e8d46aaa96b092a24ea3cfa1cda158e0c4"
    sha256 x86_64_linux: "2aab7817c668495751c67ba9dd5b51e2112c7addb8473c40172f1006d84c9362"
  end

  depends_on "cmake"
  depends_on "curl"
  depends_on "ninja"
  depends_on "openssl"
  depends_on "python3"

  def install
    args = %w[
      -DCMAKE_BUILD_TYPE=Release
    ]

    xaccpath = buildpath
    mkdir xaccpath/"build" do
      system "cmake", "..", *(std_cmake_args + args)
      system "cmake", "--build", ".", "--target", "install"
    end
  end
end
