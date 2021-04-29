class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "515e1f573b48224cbc935bf9d72cf97e79db561482ecff26f997a400254f1e63"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "58993afda8a1ee57a766a8ed9840809d8481ffed4204b7ef6d366486ac266c75" => :mojave
    sha256 "6447de058394c24560b6107f2a1eb67c80f4071cfe959b66c6bd9b176b94d54a" => :catalina
    sha256 "44403321b8c058d568708274a38508c5add3f8346e17804d27d02aed2df201b6" => :x86_64_linux
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
