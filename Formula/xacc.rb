class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "fed7d93ca4d312ab763f8cbc2a1d601ba3af9e69623d84a5ee5d3a9ed2c4c4af"
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
    sha256 "e0b3113b2a9844ebc86c2f3529d73c310a4f7cc44b4b4d39afe8121504248b9a" => :mojave
    sha256 "75d2a78b64ea9974376ed35d449aac0ab4e37f86f4b0b1c9520962015219ebdc" => :catalina
    sha256 "3b5d8d75478a4a6f2471df0b1ac97832fefa2610a6cf0882955f0b23b5015537" => :x86_64_linux
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
