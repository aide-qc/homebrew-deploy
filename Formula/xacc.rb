class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "2e6f3eb057f1ff07778a200a41834a840678d9f87b051806c90026a518f46db1"
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
    sha256 "ed0a5f6dccab9b2b71d22c2b84d25d5429f84cf8c3a01b9b7c29b87a176c4df1" => :mojave
    sha256 "078dbf0cbd48685a6afd28d05e934f099e88e04dbbcd5a1bbc49990bf20146d9" => :catalina
    sha256 "c4aed0c1d7e8d33f7247c2efed2f8cfd423e3b74c4da761e273c1c138cef629a" => :x86_64_linux
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
