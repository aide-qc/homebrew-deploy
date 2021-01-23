class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "0216793fde823b507ba81c4663ccd0a718a47f4020d6080ba120633131732082"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "ad714add56983ffbabe0975a08dfbac32bbe6eb156f2bd00f1451645d52c1e0e" => :mojave
    sha256 "c714cd44b62085b817eb3ba4406842bcfa84cafd8fb60e6bc7a009aa81c530a6" => :catalina
    sha256 "434a256e13872250651c8cd5f43ad8f390ba45f05a97a6a1dd7e4eb9c9b4da48" => :x86_64_linux
  end

  def install
    args = %W[
      -DCMAKE_BUILD_TYPE=Release
      -DCMAKE_CXX_COMPILER=g++-10
      -DCMAKE_C_COMPILER=gcc-10
      -G Ninja
    ]

    xaccpath = buildpath
    mkdir xaccpath/"build" do
       system "cmake", "..", *(std_cmake_args + args)
       system "cmake", "--build", ".", "--target", "install"
    end
  end

end
