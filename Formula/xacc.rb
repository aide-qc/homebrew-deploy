class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "fc2ee1d22b59b1462e786d0ea5e5cdcdc6cc79eb0c172005c34ab59b390eac4d"
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
    sha256 "4749f0c89408b0aa6e22c11a1a1bf2bb0aab8dd73d0b9d69a8ffde0548fb94db" => :mojave
    sha256 "e7cf1cea03975b07377038be8ce0721593e898d098c19e3e2a89b93e5d301586" => :catalina
    sha256 "7a8937f9b3910b3ca86aa2ae23deddbd97a0f6ef68934d6afbb4a946fb2c8570" => :x86_64_linux
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
