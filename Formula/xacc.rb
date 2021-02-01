class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "4b059446f4a05747cc0e9e1748f88d2faf2aa8a7846c5f8e40cbdaccf72a25cc"
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
    sha256 "8c62bce2d27ceb52c9408ca0d1e25ce2f110c4b2ddbbba8ae6953a9a74983909" => :catalina
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
