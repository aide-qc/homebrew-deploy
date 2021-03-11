class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "e10e8c5609f6502bb4c294b92fa30f67d08abda13540410b870981bea3a295a2"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "5a2b2c454a4bc9394c881e7262471503a1ca0f36013dd697d838f731dc145e24" => :mojave
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
