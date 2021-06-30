class Xacc < Formula
  desc "Quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "749989dfc2c778523d25396eaf0f0ad447986e1a8548b589e7c49301e6036c4f"
  license "EPL and EDL"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 mojave: "25c15bc7dbd6adcaf9c5623848fc643425fadee91b505d41a04eb03f1a7bde7b"
    sha256 catalina: "416c579737f796205a23f95c36e5964a39602328e23dbae028f44628e35c8352"
    sha256 x86_64_linux: "fcfcc4e1e27b15a9f183fbf15d753ca087e9b212e49250df70e7e6f953b2fc9d"
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
