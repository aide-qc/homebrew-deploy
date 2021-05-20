class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "bbbd5e7df8ad20bab7074d27b24544917e1d93abd68854f849a28d8dc650dde9"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "025ff41fd957393aa0dafd9cbb5ea9d4e29b733879f72462d423a7cee1728578" => :mojave
    sha256 "177b84dfc704288b2623c35484c15d1840023e0671a76d049ed5973aa4bcae74" => :catalina
    sha256 "e0b634dd8431068ec5e3bbbfba2139bb11861846efb15457f6842bc918f3a705" => :x86_64_linux
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
