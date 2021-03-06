class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "dc398800f3ad2efe34b128da3d4d263b9b7bdee62de92ffb14a9e1bd7579bf5f"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "b53ce005a764f95a1c2d8f4c3d03fca7f155aa85dda3923526b36e24f889c66b" => :mojave
    sha256 "c3907cc871c8faf1518bc09f11b21a4051df3827e7a46299f51d9a44a8c7aa07" => :catalina
    sha256 "d085d0001e1b87fa00082da17ab682fc1540aaf34a8f7a96181dcb6d0281bf1f" => :x86_64_linux
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
