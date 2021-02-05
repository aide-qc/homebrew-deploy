class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "cb1cf1dc5aa63e079f36134a03db18a778e8e40a9db6c96201b4fe990e7a9398"
  license "EPL and EDL"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "python3"
  depends_on "openssl"
  depends_on "curl"

  if !OS.mac?
    depends_on "gcc@10"
  end

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "99373dae274389877063fbcbfec94ac24390fd0a2e3a57cbfc6ed155da2b3af6" => :mojave
    sha256 "731e8744d56f19dc1b25abeda73ad59190e0f3510df81fee157f95404b3d15a8" => :catalina
    sha256 "a01e3616fa7976e7a4f61fce08c1be7023b8acb0dbaf6f33e7c6765a01367104" => :x86_64_linux
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
