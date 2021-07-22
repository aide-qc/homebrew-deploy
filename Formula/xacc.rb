class Xacc < Formula
  desc "Quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "bcf60eaa98f5e941ec2950ccf59cb37c36e7933a45e587fb8728ab414ee13b9e"
  license "EPL and EDL"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 catalina: "7a5f40d5c24f671698b74f68fdfbe9e29f8273248fa0ce688cd6fe4998b2b6c6"
    sha256 mojave: "8baa1674bbd0279f103d69ff0f339b9b450f65decf5c176bffc4dd895a8f4839"
    sha256 x86_64_linux: "cf3b2413daea9808f6f85cd984531651ebebbc18fa545290b09d5c812de36cfe"
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
