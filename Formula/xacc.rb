class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "785c5156e218239f9dc09074c0528c92d9d8a90f5e500c56a169ef358a1fb0a6"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "7743c7c5618d2477e6e5a2cda267cb8f50043b2097cb132a8ec89374f20facdd" => :mojave
    sha256 "039d95700d9a643e004ae0600032689a2153e8d628b4ed38cb97bfd193796d55" => :catalina
    sha256 "c2c0156810de80213fdd5308839ad9e40d36535af83e89793bd2f04a2baf7d75" => :x86_64_linux
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
