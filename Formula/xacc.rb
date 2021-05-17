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
    sha256 "a08f754b20b34cad9f41e88b38b4475317a01692ace4c123352e0b17efb14bce" => :mojave
    sha256 "ee0ae57dd532892d307cf95bacee69e7dea82a8d16814a5cac05d2d8e1374667" => :catalina
    sha256 "2c9b505ff1fa6201aaa777895f665b419a3e0d847bde8780785dec8986837882" => :x86_64_linux
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
