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
    sha256 "722967e66f55b1586e64de9f8a674d3ff3ffec1ac293901a728ba509511b19ee" => :mojave
    sha256 "4c089b5c518d502b3ff0345bb5192dc5c19b55d365f800d5d9788907871e239f" => :catalina
    sha256 "86ce4a4266964ca5860281aff732f540e254f440e6547a3a7fa7adef6c715c19" => :x86_64_linux
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
