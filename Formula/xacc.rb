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
    sha256 "69628b8996576be7de525845c415c7de46a04cbc903c9d2993df90123fd5d336" => :catalina
    sha256 "c7f9feea7f2308d8c6559093a1bbe0431c65675e9dbc57fb2440a2a6b13f43ea" => :x86_64_linux
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
