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
    sha256 "8e5131f81a7ce1cc40ba0e4ca79a597392790916bc06d93541671139e19a95b8" => :mojave
    sha256 "6b904ffcbb84640321b8177ba7eb6d0322d69f98ea4484b998e2c35c830276e7" => :catalina
    sha256 "d116890787d15dfcc89c090fc01095f0d485fd51af71112d90a76b5ef5ba0c84" => :x86_64_linux                                      
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
