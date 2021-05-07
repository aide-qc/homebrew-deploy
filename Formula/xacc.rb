class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "9cbf9d44391c2ffe9ab17095ea33985c3dd3233a3c9de752ab87c17ab1d63031"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "ac72085ac7ea3a3cf20e38689b451c0941df42d502e7a17775cdef7744e1e8a0" => :mojave
    sha256 "40a267613994feff9424e13316a02e1ca79b052dacfbbb47a988890d4a870ff4" => :catalina
    sha256 "27690faa7e5ba5de44d02cc2cccfc6988ea432cfa18b8509af6425a7ea1cacbe" => :x86_64_linux
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
