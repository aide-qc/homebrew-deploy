class Xacc < Formula
  desc "Quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "bcf60eaa98f5e941ec2950ccf59cb37c36e7933a45e587fb8728ab414ee13b9e"
  license "EPL and EDL"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 catalina: "9375e6c22245877644ce74bd0b3e342f73c4e8e856d8b000a56534a27fd44080"
    sha256 mojave: "f582b7758464aa0c5f2c26b6a1ae5ced1400a4945a1a789a0f9a084a4fda37ed"
    sha256 x86_64_linux: "7337371ef81c973cea9aada07c07e1d3f6fc58fa643c4f521187a7d1d51bf488"
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
