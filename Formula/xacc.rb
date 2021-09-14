class Xacc < Formula
  desc "Quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "8dafd76ef202c3307321c514007eca346ebbc303fc601676ad1193c7d2ef2f09"
  license "EPL and EDL"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 catalina: "f579d85fe6bb2c165bdbeeccb6dfa0d368c3041f979599964cc45bcfec8c9f25"
    sha256 mojave: "b13bce5a35fbebd4677261adc3c5f4e8d46aaa96b092a24ea3cfa1cda158e0c4"
    sha256 x86_64_linux: "0a8d20ad9eac39aed32d29dfc77a9533ec897ae4af683b1a32db145cf1aadad1"
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
