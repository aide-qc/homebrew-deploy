class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "7097af8ce757537e6b064001b40ce63c2a451614cf5b19f257c009736c16af35"
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
    sha256 "fd61472aefcc0a71794e2b2156e20a5612cebeff5501b1922736be3174beb42c" => :mojave
    sha256 "6e6ecaf5313922c0da8f7f02916967035a8cd4749c0a1ba62b183a9874ea4a33" => :catalina
    sha256 "b65582af79b873a0d54d62bdee5323e425ee480c3633f60324edb1cea8849512" => :x86_64_linux
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
