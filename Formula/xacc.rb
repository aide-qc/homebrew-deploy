class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "c178f36e19c79ea72b6c7d7ae8e0ccf9bf7417a72f5e7770458cad53fe6e6ba3"
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
    sha256 "01cc75611dff6fb30cbd9f9d25f32981410a07c7710abe500a76ebc7423950a5" => :mojave
    sha256 "e4d93373bec3df1f2f787550b477154fe62280372f5833bd1e8c0dc9189b0a38" => :catalina
    sha256 "ff900433e2a3180cb75c2a4d2a252637fd85cfb0d1c9854c5638d4f9a58ee5ef" => :x86_64_linux
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
