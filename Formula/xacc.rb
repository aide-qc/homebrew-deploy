class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "bbbd5e7df8ad20bab7074d27b24544917e1d93abd68854f849a28d8dc650dde9"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "55aad23f77caf9560897205d14a36462d594a450edc5de87ac74276b9256d1c9" => :mojave
    sha256 "ee0ae57dd532892d307cf95bacee69e7dea82a8d16814a5cac05d2d8e1374667" => :catalina
    sha256 "e0b634dd8431068ec5e3bbbfba2139bb11861846efb15457f6842bc918f3a705" => :x86_64_linux
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
