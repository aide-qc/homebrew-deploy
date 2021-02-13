class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "16dd05cedade195d819c62114f8f2b5365822eb83be4373fea805044f4ffaa4a"
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
    sha256 "d910a9b1d93d2cd2617cbcb5f7680349b54b400fe1cb40c56d281d85f88ac744" => :mojave
    sha256 "40852c40af09fd13f4b2e8468c175f12444e8a9e336f221d73af4d3832829fec" => :catalina
    sha256 "dda8c1713a97a2344c3e5a54ae1d8c226d7554ac5d17c9d6b600227b12333d82" => :x86_64_linux
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
