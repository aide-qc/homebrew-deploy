class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "dc398800f3ad2efe34b128da3d4d263b9b7bdee62de92ffb14a9e1bd7579bf5f"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "46c97471ad0a13cba519293074ed8695c7c8225f874d0e89a7a1ec62fe141a16" => :mojave
    sha256 "07c348c301df5bb7b24f199a3aaa5de14799c231a46743f75e73660462ae7a95" => :catalina
    sha256 "7ef5735f864da4a3b70a63cade1cb2d2aa10660e96a0866f23f57243aeb510b8" => :x86_64_linux
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
