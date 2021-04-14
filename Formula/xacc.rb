class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "4cb5e90f7ffcdd21a137403f8b07ef5e156673f854e89e08733dece76d792980"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "ab2beff8eb65f1959e347a8a12b512e7705a4bf2d73774eb3c2cea2a9666151c" => :mojave
    sha256 "c3d09158928a9b002019e94033fdb74bee73ae4021a85c49b3f1a0345b34af7a" => :catalina
    sha256 "ea9d34bd3c6d072966e7df887e74f0366a7831b9fa29cee68c2274b6fbf8594f" => :x86_64_linux
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
