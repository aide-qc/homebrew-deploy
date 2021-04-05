class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "b542dc39336d58a47081dcc4b7831cd1f6610d15367cdba0479920588eade597"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "120ca0ac848fc1a15091dfeabde02c6f4266bc314b04e5e365364148602ca530" => :mojave
    sha256 "da90825f7fd3db81640f30ea5bcee699719559444ae2b0bc96e5a8875d70ae5e" => :catalina
    sha256 "c41a8bf0a9f3a74c1a6a193f2b7af54c41422b66e9ae30f65b93303bf6a3860d" => :x86_64_linux
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
