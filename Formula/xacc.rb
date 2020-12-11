class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "b696f0b907cd5b50d3c7ad80f61fb8c2d616e8f261283aa6bccde70a98fb5c2d"                                            
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "fec983ec0da4db885e4251b643ff8ef79f98b962cc644014098eab6b3374ea0f" => :mojave
    sha256 "ba5e6c8b3a602cdae95eb5a2df76fbd8113f3c01c4671d9f72fde761f52b1393" => :catalina
    sha256 "4708a8a8913d888598df8e303fa5aee251e8328f322de355748ebbabf5247ca4" => :x86_64_linux                                   
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
