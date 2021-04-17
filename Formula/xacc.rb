class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "d406cd9215a0bf5ae5825355dd1333b8f645746bd37438baf9a7617d4b700938"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "53fd5f7500e705abdc865a295c64ae19f897da77f13274052e3607446b69da92" => :mojave
    sha256 "c2fae2bd50fee5068bafcce695e7a0363bfd702793a2d857596184bfd7b30b45" => :catalina
    sha256 "095d11a91f2235868944719ca269f79f3c70ecdc5651942240c98b5cc9ae35e5" => :x86_64_linux
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
