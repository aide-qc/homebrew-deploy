class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "b5e917d6e2dffcd04a2b9b23561840bae5e85cae96623dcbd88e524a9c585783"                                             
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "dbdcac48fd5bbcd57e751a435993387e5a3f0a8647cf8e4cfaa51fcc854742ba" => :mojave
    sha256 "da191374de3b124710418676b9231b98d27adda190ad6c336739fd80fd06e29f" => :catalina
    sha256 "b718438c57e2b6b0937fbd470920d5b774671e010d006085ec6ce19b7af3ea61" => :x86_64_linux                                                    
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
