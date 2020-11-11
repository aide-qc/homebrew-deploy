class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "0873bbf4f2ded49263d39fd4ed01c353e3d5d7799fbcaf8f03e3c72e55a43078"               
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "c18d9306235da6251776ffbc5076dfdf73498b60ea51edbb0a21c4513dbbae7a" => :mojave
    sha256 "345f0c93631d89376714bb064a2e5800bb964a2eae07b376843017c6076ba986" => :catalina
    sha256 "3a135e47e4e96afa363066d735af2491424238e94f2975a170794d34c11206b6" => :x86_64_linux        
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
