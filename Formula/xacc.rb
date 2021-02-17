class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "5d419a98d8aa731d096ae2d968ebb7c00474435409047fa71f859eaf066ba9c5"
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
    sha256 "9cd82bb54ae257476e904ca6eea67824c5cd6e98f275b161c3cdcb5aa107af1a" => :mojave
    sha256 "d6e18f9a664a59ec99bd4b6c3c8f2b27ecbdd2b8f593094b84f5d773bed5b4e9" => :catalina
    sha256 "6e512d29fea209e693bb2e2d96b0ac142efcf57de89d8f5669af354abcd19dd0" => :x86_64_linux
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
