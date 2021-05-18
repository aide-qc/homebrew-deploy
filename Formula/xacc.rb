class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "30742a7f26da8bb0c18e0624f262412008c03392265550c31ece920bf14773d3"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "5489dacef2ff04c0ac4883d5e35fd6cd1e22c6d0815b0c087927dee5b60c65bf" => :mojave
    sha256 "ee0ae57dd532892d307cf95bacee69e7dea82a8d16814a5cac05d2d8e1374667" => :catalina
    sha256 "6243bea343eefc3dec55351e786e25cc000ef29d2d70a516a4f0b21858d5b214" => :x86_64_linux
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
