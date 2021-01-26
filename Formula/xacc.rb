class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "0216793fde823b507ba81c4663ccd0a718a47f4020d6080ba120633131732082"
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
    sha256 "260ebd67ed46b2dada18bcb20c252c1b87c02f0e15ae9cce01d915aef6a97a48" => :mojave
    sha256 "4fd7b96e23ced26f0492ba48fa8c6e0b82badb2beb2b9ce16987f75a5adb8a45" => :catalina
    sha256 "6f483425322e20ad01f07deeba55164a491e220462be5698636fcfeb01c346be" => :x86_64_linux
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
