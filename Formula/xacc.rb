class Xacc < Formula
  desc "Quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "a43f9924633896fc512a753ad63102e6ff09c86cee59c3cf736720b29c3a90d5"
  license "EPL and EDL"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 catalina: "84ebde63c8eb671cd14e8d7c3fdee472440408aaf08b3e458b0c137f724b6299"
    sha256 mojave: "eb548bf43a6de1b8f0058cf2ba59b1fad4bc5089ed3fa341e222a89b82b7dc1a"
    sha256 x86_64_linux: "6d8b0439cae4a3b33949eaf1998924ee191756b5a95c37c9302a21ed04981f15"
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
