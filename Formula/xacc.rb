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
    sha256 "fbae6dd0ed057b54e841eb255140a54b3aa1c1c4385bc537aa93d4e52bed11ae" => :mojave
    sha256 "c7874e450de93a336224a9307caa4155a083d29fa830dc83e988b4cbfcd3a0c6" => :catalina
    sha256 "7bf3864c4c7a014b57e51194713a4f8646863e7e6326e2319ab28c18b1613936" => :x86_64_linux                                               
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
