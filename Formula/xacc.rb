class Xacc < Formula
  desc "Quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "bcf60eaa98f5e941ec2950ccf59cb37c36e7933a45e587fb8728ab414ee13b9e"
  license "EPL and EDL"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 catalina: "ed96655eba494852c52a767737a39f43d492acd95d51c09825ffb123765e211a"
    sha256 mojave: "699d7333a238b69897c6e2a67131d8f473e73a06d40ca108a5fa27e09ca8c4b2"
    sha256 x86_64_linux: "5cb10dddd85f69e78999ed2ebc5cff55f170bcdb16a34cd90f896ebcba013528"
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
