class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "00428d9e7bafb11a445eb94604706e3c7ec1e95181e62d47b5b553c1e1ef34e1"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "9c1e4b46d78c13ae3d44c545fd5d0f60bf697e138e8ef5c7d17076412a642bec" => :mojave
    sha256 "f33c735d4df71ee4eb85d7f064389b2d153d9089f52283ee7b3b56fc421e9ef9" => :catalina
    sha256 "bc675e0b0fcb9aeb842287ab10e8cc8662954470dfcd0397c9c99fb4d61be5cb" => :x86_64_linux
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
