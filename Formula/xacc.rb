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
    sha256 "2681665fc7111381086e045764715501e66f85dc6af128e42154f09aef82f364" => :mojave
    sha256 "6123fe25cea79bf0663cb1a68610f416a2382f8b4b838081491c1431fb201baa" => :catalina
    sha256 "003d4d36ee20f1afc73de12c273392267998b1318221c3f9c717b88ec5060381" => :x86_64_linux
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
