class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "749989dfc2c778523d25396eaf0f0ad447986e1a8548b589e7c49301e6036c4f"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "386841f9e98ce2bf0ec7d83d4d9b297e8c81fe04fe3827f300cf60e01bfea1fa" => :mojave
    sha256 "a1b548d4b80df8baccc7188197b4c8c9bb938c7dd5ef774930276e308ff28881" => :catalina
    sha256 "875776032c067565df741d40bf8356be5166cfe2dbb3b1654e8cacde84ea547a" => :x86_64_linux
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
