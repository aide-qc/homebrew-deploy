class Xacc < Formula
  desc "Quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "a09fec4717687e18438ec5bf424adc4fe5e0549f34bfe30111b28dc83786e7c7"
  license "EPL and EDL"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 catalina: "46eac6e4a8354c7c1f6fe5c4dfd4e4aa2814177aa65149a3b9f13cbbc0ef667d"
    sha256 mojave: "b13bce5a35fbebd4677261adc3c5f4e8d46aaa96b092a24ea3cfa1cda158e0c4"
    sha256 x86_64_linux: "6dbba583418f004f23e72a029fecf0a795225fb5d5a081b402c7f5446065fbe5"
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
