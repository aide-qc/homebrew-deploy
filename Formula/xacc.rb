class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "e45ba4cd1ff2e172ca25b6d8e39e34b7b6b6ccb070754ad0e5cbc441e3b867f3"
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
    sha256 "4241bc4bb2215e0ff9e5b626467509e080644f71220d83de61701480027756bb" => :mojave
    sha256 "0c7fd29f3659a31b2d3140a283b6658baef92fa4c0c0b921d535add5f6eceb2e" => :catalina
    sha256 "a5d781531f9fa319e01b6dd3817ed82decbfd0923072ff6a05945ead01ebb7c7" => :x86_64_linux
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
