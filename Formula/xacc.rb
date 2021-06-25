class Xacc < Formula
  desc "Quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "749989dfc2c778523d25396eaf0f0ad447986e1a8548b589e7c49301e6036c4f"
  license "EPL and EDL"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 mojave:       "1735e2d53c790e8e4d6d78ad6493e9e5bf04d57325f44aebe3b42757abbb4a26"
    sha256 catalina:     "5c54b345b9ebf5c9d82927e705655ad4769794783bb39857834d7164d7ac5743"
    sha256 x86_64_linux: "b78df15f7488b2f1826b3804716a0f1f008925f1c718519f83cf118310b530e0"
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
