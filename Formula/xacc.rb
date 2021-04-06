class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "922a6870cd71d3d9e6e68de61038cad2cc598bc1464c4d1171bc1ab9d03a08fa"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "a2c6e291b374fd4cdc6903c2bcacf181f23f16c9f15acb84b74414e70696cf8e" => :mojave
    sha256 "4457946f89e6477f35f77f6c0c0d706f2794ccda7ed82e3afabb6ea1929bfdf1" => :catalina
    sha256 "847d14cb58bbc500961d9b2f4aa48913a4e5bdf9143ee014d79f1c2dca9f7209" => :x86_64_linux
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
