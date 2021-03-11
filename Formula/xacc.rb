class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "22812d17e0f7486b4dd63f21164dc72a4230fe0acdd8ed38deafb98850db00a0"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "d6ebd1bdfee5bd0c97ad4eb0a1b20bccc9eb5d63ff52a14cef81246ab178ab25" => :mojave
    sha256 "2e51a3c82b27d0d47ab7b79103a864457308c5517c7e4805c14323337380b44f" => :catalina
    sha256 "1b1edf9f330da5810b325e4073343a4af9fa2f7e500afad32704770986493c57" => :x86_64_linux
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
