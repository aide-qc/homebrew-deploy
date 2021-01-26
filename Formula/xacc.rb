class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "fcc9ceacbd61b54803249150816554471f627628491bcdfa4ae1ff15d75c9fee"
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
    sha256 "260ebd67ed46b2dada18bcb20c252c1b87c02f0e15ae9cce01d915aef6a97a48" => :mojave
    sha256 "4fd7b96e23ced26f0492ba48fa8c6e0b82badb2beb2b9ce16987f75a5adb8a45" => :catalina
    sha256 "a3fb7d5fca1fd0021a2026e31fa72cfc2255693f9a4ac53493dbc8eb327d326d" => :x86_64_linux
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
