class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "9c3683ee401f9b4debc40b7e2da7c230ccd76a00827ec8211f3b3240a074fd57"                          
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "gcc@10" 
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "fbc43ca52c8df021301ac825b5e9b06a5480e73a33ed97600e539706d2e43226" => :mojave
    sha256 "86efd689fc69b37867f02164ee8b93a0d88eb6ac26f3583a35f73fa629c6b926" => :catalina
    sha256 "b681ec6d55280adad00e40f1fbc2c8008b174ef554836667b2d4acb4aafa83d7" => :x86_64_linux                  
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
