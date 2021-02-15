class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "7097af8ce757537e6b064001b40ce63c2a451614cf5b19f257c009736c16af35"
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
    sha256 "08009fd9d5375ea9d20eff95e43d9d6d3e2a6e39d75553620c9b5666b3874a0e" => :mojave
    sha256 "4125f4c2132c364c40e51351823cf2576b9228e6a6871a49a5e646bfd84b08b9" => :catalina
    sha256 "14af35d075687ef4af8f4af2363ee1d0274c32a2fc7f6b443d98e96ad23480a2" => :x86_64_linux
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
