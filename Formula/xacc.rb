class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "c94f1c462b39208d48a6c46b0e8412a4ca51531ea383f93740a5de32b4371a46"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "ac72085ac7ea3a3cf20e38689b451c0941df42d502e7a17775cdef7744e1e8a0" => :mojave
    sha256 "1f1ac6ffacd1ed8e79943318b6289b7d764f1dd7f5feb8c678a5e39f5e6dc074" => :catalina
    sha256 "377dc2090dfffa9ddee6c6f915be44b1ee9f1f6e3a103c4de7d2e5b3e519916e" => :x86_64_linux
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
