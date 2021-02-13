class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "16dd05cedade195d819c62114f8f2b5365822eb83be4373fea805044f4ffaa4a"
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
    sha256 "b183767c419c7fd2b482470fb17bac2a2c2f0c26e5f6959ac41705b65d30a144" => :mojave
    sha256 "323ffda5fe123f22ebb3cd4ac4ba5ce4e5e82ce7d9174a810bd4dd73be970796" => :catalina
    sha256 "cf94698c06942ddd8156a1f638b00b829911144261e99965d7cf22a0c0f625b9" => :x86_64_linux
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
