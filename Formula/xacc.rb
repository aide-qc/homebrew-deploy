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
    sha256 "7743c7c5618d2477e6e5a2cda267cb8f50043b2097cb132a8ec89374f20facdd" => :mojave
    sha256 "71b2fae66bd4df517e4e2618cd756bda136d2c159b73aa50c538e318c35c247f" => :catalina
    sha256 "ec63a057777ba31d2d1fc04a13d6b836ed7016d680350b378777d476ee92f017" => :x86_64_linux
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
