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
    sha256 "55aad23f77caf9560897205d14a36462d594a450edc5de87ac74276b9256d1c9" => :mojave
    sha256 "ee0ae57dd532892d307cf95bacee69e7dea82a8d16814a5cac05d2d8e1374667" => :catalina
    sha256 "a5870b75e9c5cefdc4c9ad73bdcfc69dd8d0a7e649177b898c6cd3d3aa9f3a52" => :x86_64_linux
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
