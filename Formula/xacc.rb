class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "785c5156e218239f9dc09074c0528c92d9d8a90f5e500c56a169ef358a1fb0a6"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "76dfe2e7bcfbdc0dc2a84e0316e8156362cdcb4899d30ccd00b75031f1545cf2" => :mojave
    sha256 "69628b8996576be7de525845c415c7de46a04cbc903c9d2993df90123fd5d336" => :catalina
    sha256 "c2c0156810de80213fdd5308839ad9e40d36535af83e89793bd2f04a2baf7d75" => :x86_64_linux
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
