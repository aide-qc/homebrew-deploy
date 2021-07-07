class Xacc < Formula
  desc "Quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "ec98b887b6cee28ee5771ca3be13de0f4bb3387434876e9dbd32de90741a98cb"
  license "EPL and EDL"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 catalina: "386f468c8421c3b501070257f5c15b9d50a7ed7ef78a2f2ab9d6aee2e10c2d3f"
    sha256 mojave: "edeae6f85e8272b20b8600973ec2e9c4445ad477d963c3fe4792c4101773d244"
    sha256 x86_64_linux: "dfacd611a6ee30daaf74cfb9983b8605f9b2a5658a723e079fd9618bbcf5e98a"
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
