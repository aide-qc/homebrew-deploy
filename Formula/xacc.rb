class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "2a3bec17cac0c9662f7679cdaceedd955c9f53a9ed38115b129e1e17fbdbe8e7"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "9c1e4b46d78c13ae3d44c545fd5d0f60bf697e138e8ef5c7d17076412a642bec" => :mojave
    sha256 "f33c735d4df71ee4eb85d7f064389b2d153d9089f52283ee7b3b56fc421e9ef9" => :catalina
    sha256 "4c810d2296ad096e95405693b53ea908deb99f0229968f8f748f50772087499b" => :x86_64_linux
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
