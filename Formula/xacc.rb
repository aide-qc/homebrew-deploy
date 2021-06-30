class Xacc < Formula
  desc "Quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "ee5bb712b3a8516b196438f2377cc0acda612861d8065f8cdbd23e0f06958384"
  license "EPL and EDL"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
  sha256 "ee5bb712b3a8516b196438f2377cc0acda612861d8065f8cdbd23e0f06958384"
  sha256 "ee5bb712b3a8516b196438f2377cc0acda612861d8065f8cdbd23e0f06958384"
  sha256 "ee5bb712b3a8516b196438f2377cc0acda612861d8065f8cdbd23e0f06958384"
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
