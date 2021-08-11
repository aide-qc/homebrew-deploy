class Xacc < Formula
  desc "Quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "e7780439489bf6672e695f3fd5192272745bb5798422aa117843b8a25cf6e3d2"
  license "EPL and EDL"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 catalina: "e3b9381c2615f8dc769ecf38b48ff464ee5ab054ed4db5fa8befc517f3f54ff4"
    sha256 mojave: "b13bce5a35fbebd4677261adc3c5f4e8d46aaa96b092a24ea3cfa1cda158e0c4"
    sha256 x86_64_linux: "8ca268624ce74cba137c53f7331dc7a0ef681b6dfb5137444e88e22db175cdbf"
  end

  depends_on "cmake"
  depends_on "curl"
  depends_on "ninja"
  depends_on "openssl"
  depends_on "python3"

  def install
    args = %w[
      -DCMAKE_BUILD_TYPE=Release
    ]

    xaccpath = buildpath
    mkdir xaccpath/"build" do
      system "cmake", "..", *(std_cmake_args + args)
      system "cmake", "--build", ".", "--target", "install"
    end
  end
end
