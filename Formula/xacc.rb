class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "b758b22c9bacd6c86d41e1dbc224232d9b11c94cb7dfbd9489c05f54129b6c63"
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
    sha256 "fdba1f075a90c53cacdf51c33b56ebfd4738a27b97ae102aec8bb6568a5345e3" => :mojave
    sha256 "47e21be39894668f7e655fa6af29c365333ee1a7792d3ca124f86bccb9ba65fc" => :catalina
    sha256 "6a5d3c6c17606716e83755d1e065bf6ef37cebb26c5cc517447b3e5be59702e5" => :x86_64_linux
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
