class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "48998e581bb77bd84d7b83d8db92443022f42018c82883663b762d33cec9337b"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "9a449eed0f0577418f923e7a8bb0dffd3ccf935eb82770096550524001dbd66e" => :mojave
    sha256 "4457946f89e6477f35f77f6c0c0d706f2794ccda7ed82e3afabb6ea1929bfdf1" => :catalina
    sha256 "43b2eaa775b31bac57cbba728051261a62eda973d79cf88fc7aa50e6c1830eca" => :x86_64_linux
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
