class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "3fdda89192cca05b3f25cc19b2b35c6ceaef1fa8fb84e050cf4d5e7edcfa1624"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "076772be0baa4e32dcb95069158df6680f0ae773f43a62261c93f4c419b381e6" => :mojave
    sha256 "01f16bfa5730c766e7c7ae604b9a5d4ca335026ad27f7bb554459f535eb45a04" => :catalina
    sha256 "c6acf5404cd1d6a0db124c0fbbe648980bd2741c06a16b89cb8f4b644d6bf9b9" => :x86_64_linux
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
