class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "747dcf276bffe441c51cce6f3342bbf7529fef19c176f8a725c5e7634c44012d"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  if !OS.mac?
    depends_on "gcc@10"
  end

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "8a73c16c2d164f45a942bd0feb2950d914c203dcdc88dcb534a5251dbbc7b077" => :mojave
    sha256 "0c7e70f219c3f96be2d9b7ac4f343fdcd2d37198a2f7d08d2c35129fdc77baac" => :catalina
    sha256 "58ad40ac3628724c16165f779781e6d6fe7a79e84b988c27a8020c9b66069b31" => :x86_64_linux
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
