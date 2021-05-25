class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "8aa6eae70cc785872b5ea947449ba011b9105a9e1c961a605326911d9a7756f6"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "8d1cbc9d9f1931b41f884411aa097c1f75fea0e13406a959aa73f046af6ad0b3" => :mojave
    sha256 "60c1bf7ea9a98597332fa3b18d00041aca8a07bd6cef2cfda4ff6f7b2bcde4ff" => :catalina
    sha256 "5d78614616eedb6648edd565508e7d77b46aa885694bece567cf41e28082eebd" => :x86_64_linux
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
