class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "15ccc0877dadf3a25a48ef8eaa3b95d3d5a77a9759a396a01ed2ffcdf8b68a40"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "76dfe2e7bcfbdc0dc2a84e0316e8156362cdcb4899d30ccd00b75031f1545cf2" => :mojave
    sha256 "15a0a806c2f4f0db6514342448547f0bf3fc7a90320c4f34fe2e84098bef0a2b" => :catalina
    sha256 "ac68278886d5cbd2bf06bda9eebe030ee833e6d88cf3301199e07b7367f49a5d" => :x86_64_linux
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
