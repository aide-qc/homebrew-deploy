class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "749989dfc2c778523d25396eaf0f0ad447986e1a8548b589e7c49301e6036c4f"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "78d89b011b62550d871f598b6a4220563bd45bf194caf0ae7c8f1aa6fce90854" => :mojave
    sha256 "15a0a806c2f4f0db6514342448547f0bf3fc7a90320c4f34fe2e84098bef0a2b" => :catalina
    sha256 "ef706b140f591067324da8a470c3bfd01f901e4194ddc12d2c3f263aef811e07" => :x86_64_linux
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
