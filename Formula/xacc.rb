class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "dc398800f3ad2efe34b128da3d4d263b9b7bdee62de92ffb14a9e1bd7579bf5f"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "5994b8e2ac968fa43edbd3ee06c2ddae16ea28c3cf1a2e6bf4806e709cc6de7e" => :mojave
    sha256 "4f8b80f7bb07a35936b8cf1e71f76f5842004459886dc7a109d59b7c501feae9" => :catalina
    sha256 "301a7fe574537b7dedb886176fd45a40fdeef28c696b1672bbeb595279b7b0b8" => :x86_64_linux
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
