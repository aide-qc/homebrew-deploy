class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "1bc7c718e37881b14caeaff6e8fa5629298a064e881fc36ac9df3ba21110b993"
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
    sha256 "3625f2b1c0ff1b94a2a538921d7463af4bf13df1136b70d4bb046a929dbaeab4" => :mojave
    sha256 "7e9b2f7f6e1b43ace6ea04aa1bb3bb8f7cf43eb19a0b6c16a48f7c0c72c6a7d4" => :catalina
    sha256 "ef0b2834c641ac262b25c7d08c9ef60e3b88d3e03248be1c658eba3c2153dccc" => :x86_64_linux
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
