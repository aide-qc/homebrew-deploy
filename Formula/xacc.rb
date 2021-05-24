class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "b418ad4bbb07e9e477849e5cd5552b64e8735fdb9361432518482945f084c203"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "ef147e50de9d23c2e52e62b6fd8bfecdfcaf26eaf97255e809736c63bcab9437" => :mojave
    sha256 "177b84dfc704288b2623c35484c15d1840023e0671a76d049ed5973aa4bcae74" => :catalina
    sha256 "0e1f0da6caef457f3de3717c751366d51ec1c256aa6026e6c3009ee08f10300b" => :x86_64_linux
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
