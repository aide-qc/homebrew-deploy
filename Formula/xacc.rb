class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "82e4d021686860c72eb1c821e2b4cb7f21beb2c19a69f7b30a4466f0c4f65d61"
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
    sha256 "2ef8d9f6dea221ca4e0b3c4b68eccdf580361ecde8ea3a73e8f575e26d261fb9" => :mojave
    sha256 "2fad1892cd279dd9943acd524d9b7cb6a6d20d7333683f2fc8ce090da48cc55a" => :catalina
    sha256 "a01e3616fa7976e7a4f61fce08c1be7023b8acb0dbaf6f33e7c6765a01367104" => :x86_64_linux
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
