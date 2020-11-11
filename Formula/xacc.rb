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
    sha256 "99a145f87b0f4f4a33ad7d48bcb1cf7d43347a34df4fdba28627408f6283aca6" => :catalina
    sha256 "20d8a1147112a4f58c1a6c33770d7a80feefe24576c1a628fb3d955365592199" => :x86_64_linux       
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
