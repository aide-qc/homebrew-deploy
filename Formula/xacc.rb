class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "cd5fd3095765253c1f54541f6027c6609f9e471ece9d710713e321288190060c"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "76dfe2e7bcfbdc0dc2a84e0316e8156362cdcb4899d30ccd00b75031f1545cf2" => :mojave
    sha256 "15a0a806c2f4f0db6514342448547f0bf3fc7a90320c4f34fe2e84098bef0a2b" => :catalina
    sha256 "3fd138dbe729eeabd4c507935216c90c27b668ea951ab94120050fbaa04d45c4" => :x86_64_linux
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
