class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "4cb5e90f7ffcdd21a137403f8b07ef5e156673f854e89e08733dece76d792980"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "8b27d99f6a0d67cfd9a5e11ffe09af8585fb2f7c216a76345441ddc82669974e" => :mojave
    sha256 "c2fae2bd50fee5068bafcce695e7a0363bfd702793a2d857596184bfd7b30b45" => :catalina
    sha256 "8dc39d99000ea93206600b102b235e583abe1affc23b60f186667cc856a9d007" => :x86_64_linux
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
