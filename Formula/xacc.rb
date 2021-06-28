class Xacc < Formula
  desc "Quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "749989dfc2c778523d25396eaf0f0ad447986e1a8548b589e7c49301e6036c4f"
  license "EPL and EDL"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 mojave: "b289103bfaa2ae2db04fbd24b0d40eb76825712b534cbc562605b84193b2b514"
    sha256 catalina: "5988575c69d32c88bcd70c20a0989b226f8ee5cc0c76047eb580e100168f4081"
    sha256 x86_64_linux: "bd6d7f138d4b39c6248d0bc3075f15d47f8a3ec58fd97ec20854847a40db7546"
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
