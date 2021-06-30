class Xacc < Formula
  desc "Quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "ec98b887b6cee28ee5771ca3be13de0f4bb3387434876e9dbd32de90741a98cb"
  license "EPL and EDL"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
  sha256 "ec98b887b6cee28ee5771ca3be13de0f4bb3387434876e9dbd32de90741a98cb"
  sha256 "ec98b887b6cee28ee5771ca3be13de0f4bb3387434876e9dbd32de90741a98cb"
  sha256 "ec98b887b6cee28ee5771ca3be13de0f4bb3387434876e9dbd32de90741a98cb"
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
