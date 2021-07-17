class Xacc < Formula
  desc "Quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "a43f9924633896fc512a753ad63102e6ff09c86cee59c3cf736720b29c3a90d5"
  license "EPL and EDL"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 catalina: "992ac53dd0615fdfc574b27fbc2c18157bbfe242304f22eab6bebd849744f3a9"
    sha256 mojave: "de596b3e83f7704afd2fc6f93d0feb9771f7024f2cc5a77ee87a71e4b6ad4cc3"
    sha256 x86_64_linux: "d1d8025855472f6f8b1d46ce68cd8bab9b67180258e58222442d948ea7ca81e0"
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
