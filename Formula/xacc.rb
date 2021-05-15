class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "d8a36a63f655eb897fefd868cb98f8fd84e699b8508a0aba5c46f0dbd747624a"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "67894fdc36fdd92e8035d720e5c7affd53e118c7c44049643d14c25da89d7b1b" => :mojave
    sha256 "5c6abeca6786ce60bcb3d1da578a249d397d630f59d9be5fb7e2502ceaa31229" => :catalina
    sha256 "2bcc10129f747a9ffc59be5e8e2bd232fc4c175d4981f9bfe85e7d4daa2e4315" => :x86_64_linux
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
