class Xacc < Formula
  desc "Quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "a43f9924633896fc512a753ad63102e6ff09c86cee59c3cf736720b29c3a90d5"
  license "EPL and EDL"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 catalina: "2278eea57aa8cb565f033f30fbeacafe53df1c3e15ed61819d7c7d5472546bc0"
    sha256 mojave: "de596b3e83f7704afd2fc6f93d0feb9771f7024f2cc5a77ee87a71e4b6ad4cc3"
    sha256 x86_64_linux: "318001034362c74feee4ab48aae5859869d1a039c7abd6ff621642b79dab8ac1"
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
