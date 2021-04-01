class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "b7d20e57286a1bb29986c382b79595391c622efd9ade56750df483a8b22867fe"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "1becc4f93c2de4f7ac410c73158c9cb30fa242e64b16c3811becc04321f5e868" => :mojave
    sha256 "d8498be9c080d5046a0f8eaf1722adba57318ba8fdf75b4d4735ea37c3538f51" => :catalina
    sha256 "f50528ee2be88b06784aff51165fe6c1f0a4184a8dc03bd2c1c4865c8f0174f9" => :x86_64_linux
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
