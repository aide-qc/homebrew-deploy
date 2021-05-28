class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "2a3bec17cac0c9662f7679cdaceedd955c9f53a9ed38115b129e1e17fbdbe8e7"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "722967e66f55b1586e64de9f8a674d3ff3ffec1ac293901a728ba509511b19ee" => :mojave
    sha256 "9c92fe2a8ae2d4140c75aedd17fa9f1553d040a9a73e00c75953dc8dfe634dce" => :catalina
    sha256 "4c810d2296ad096e95405693b53ea908deb99f0229968f8f748f50772087499b" => :x86_64_linux
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
