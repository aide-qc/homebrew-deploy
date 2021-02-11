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
    sha256 "3963336b795f129e6d5525e2d0d056a7722d576a6f6eb662502613f3e3543ed0" => :mojave
    sha256 "fe37e3bb445ed4f3e894a7e02e2c6207aced4ea178aa98eb2c887bc00d2f9840" => :catalina
    sha256 "ef0b2834c641ac262b25c7d08c9ef60e3b88d3e03248be1c658eba3c2153dccc" => :x86_64_linux
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
