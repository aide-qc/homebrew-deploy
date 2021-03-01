class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "2e6f3eb057f1ff07778a200a41834a840678d9f87b051806c90026a518f46db1"
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
    sha256 "c39f40e2fd838fdd0578ff9b75254db8a3a97a8da532d6f94729e489640d2354" => :mojave
    sha256 "406a9f21d05826dec7f9e7e2fa7d1baf249bcaf447a8220bdd50c3b291e8482f" => :catalina
    sha256 "a0cfaa5a8d7e7303e287c871d8d82fe70733f58d1ba317dee7fffba76798e7cd" => :x86_64_linux
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
