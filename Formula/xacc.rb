class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "2ab52076ba6e8123c9621fd2a39cdef233b58470252fd8dc64c2dafa05e2c560"
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
    sha256 "ad20194f4433915b8b2a067aa314994b9e072c09c7e0d584cdd39dc2d81c0825" => :mojave
    sha256 "47e21be39894668f7e655fa6af29c365333ee1a7792d3ca124f86bccb9ba65fc" => :catalina
    sha256 "6a5d3c6c17606716e83755d1e065bf6ef37cebb26c5cc517447b3e5be59702e5" => :x86_64_linux
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
