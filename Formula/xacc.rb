class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "90df0b121650c50f7ff3acab91472a9c960ab23e474d6f932f6e14a59774bdb8"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "c2b04a619754c572076c7aee8c65f093432525278f251303b212abd57b763d76" => :mojave
    sha256 "6123fe25cea79bf0663cb1a68610f416a2382f8b4b838081491c1431fb201baa" => :catalina
    sha256 "34ad8da37465d0c07f80d7c95ee0af9ae859164a77340d61324c6916cbcbc618" => :x86_64_linux
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
