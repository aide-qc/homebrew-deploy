class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "7ff7b6b02aadeb191e34814491adbd2547b2a114e0729e7bfb737b952c1b5a35"
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
    sha256 "f058cd5d4b0d1a1a28c75fa4384052482111a423cb14d6ac08e5c43573152727" => :mojave
    sha256 "7001eae508027d999277fd05af0f69c2bbeec57742d1dfff39a8f02b07732600" => :catalina
    sha256 "0870668ba6d668563047a3f72569cfd22af4719076b5cea7bfb1d37479fd094a" => :x86_64_linux
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
