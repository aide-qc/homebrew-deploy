class Xacc < Formula
  desc "Quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "bcf60eaa98f5e941ec2950ccf59cb37c36e7933a45e587fb8728ab414ee13b9e"
  license "EPL and EDL"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 catalina: "80a17517dea80bab035b2aa1fb1f54335c9f47209ac22b723b56956b7169e91d"
    sha256 mojave: "482b76d5df034ce4c29a0ef599528b80d74a6406df134d478cca2d5b787ad926"
    sha256 x86_64_linux: "d21bc720cf6777216c25cebc88d31c6a2abdb3b28e51e4a72b42eaba470b6b83"
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
