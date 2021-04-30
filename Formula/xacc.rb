class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "515e1f573b48224cbc935bf9d72cf97e79db561482ecff26f997a400254f1e63"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "7040b494dcb53180e14295a09c19cd4e747551187f2c29d030d60dc8a931a798" => :mojave
    sha256 "84591dac7c9c555576b90dbb5b2932658070839511d5670842729b7f4708eb56" => :catalina
    sha256 "f4080d6bf87e19ab436666db66e15e643703b35ee742cb145e8bf8942fa94826" => :x86_64_linux
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
