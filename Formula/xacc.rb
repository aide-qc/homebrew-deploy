class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "7dbf29d351a7c5c361b777f36e2236530a1bfb2f8599ad75b7c862c94a06ca4b"                                                 
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
    sha256 "fc74438da61dc1d807c53bf95ec40eccb09106e34df17b146377addc8bebdacb" => :catalina
    sha256 "c66bfff79a8af6d7bac4893d170c2f0997c1a2f42f4fd469c187b446142d515d" => :x86_64_linux                                                               
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
