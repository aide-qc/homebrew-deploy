class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "c178f36e19c79ea72b6c7d7ae8e0ccf9bf7417a72f5e7770458cad53fe6e6ba3"
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
    sha256 "6bc0ad23e803897543bcecf397140cac370e0cc639f0e60c8498280f9764bf83" => :mojave
    sha256 "40c3cb36f14cdc9afbdfca4f9025fc5bf9430ee57542966aad1863ea4b4a9a19" => :catalina
    sha256 "b900c0eef09918805627ebb10dad66d559e6310d03253a619b7b72e36e0337fe" => :x86_64_linux
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
