class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "f494be3e4c235c4e9baceb0888881cd65a67526dcc2ad2671bc20e10db5ad2b4"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "448136f1e7dcdc26a43bed5872b887f27bec6952513c96e69ef2ca35487070ec" => :mojave
    sha256 "c6f1f734fee9500b199dbf2bcd0df80c33e7f470e1c49bd0203d1e677778bb34" => :catalina
    sha256 "9e9522fa6afb83cef615bb791872090f8bd4c2f9c13c9b2d9e113d1dff115ad5" => :x86_64_linux
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
