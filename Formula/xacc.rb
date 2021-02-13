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
    sha256 "05209a1494d20d0055d3c9bc154f6e7973f44a9bb0cc97ef09d83e1c4a814f6a" => :mojave
    sha256 "323ffda5fe123f22ebb3cd4ac4ba5ce4e5e82ce7d9174a810bd4dd73be970796" => :catalina
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
