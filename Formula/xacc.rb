class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "3729a53ed220af14b2a7bdb0a73c2d2f44abe3a4fde4013c0d4adf6eea77f584"             
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "c18d9306235da6251776ffbc5076dfdf73498b60ea51edbb0a21c4513dbbae7a" => :mojave
    sha256 "bbc360bf5bb6966bbbf4c34fd533dcf540cd2183737210020c8df69e505919d2" => :catalina
    sha256 "4ca28199acfb4a3fe8468e4c44d16043d250bd6e7281dd37c16a16812736d698" => :x86_64_linux  
  end

  def install
    args = %W[
      -DCMAKE_BUILD_TYPE=Release
      -DCMAKE_CXX_COMPILER=g++-10
      -DCMAKE_C_COMPILER=gcc-10
      -G Ninja
    ]

    xaccpath = buildpath
    mkdir xaccpath/"build" do
       system "cmake", "..", *(std_cmake_args + args)
       system "cmake", "--build", ".", "--target", "install"
    end
  end

end
