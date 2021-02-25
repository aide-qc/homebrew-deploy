class Xacc < Formula
  desc "xacc quantum programming framework"
  homepage "https://github.com/eclipse/xacc"
  url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray/xacc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "2e6f3eb057f1ff07778a200a41834a840678d9f87b051806c90026a518f46db1"
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
    sha256 "ad20194f4433915b8b2a067aa314994b9e072c09c7e0d584cdd39dc2d81c0825" => :mojave
<<<<<<< HEAD
<<<<<<< HEAD
    sha256 "f893cd097571356727280db48e46991f7d7f934a3c3b46cb4a0f326f66fa7a3a" => :catalina
    sha256 "bc73f2f613dc45ff786ac759cf2ead89d39c138777abc3727d445887f5f8d3b5" => :x86_64_linux
=======
=======
>>>>>>> 334d5ca5cc4f623609d6b503ac952c4462abc804
    sha256 "f893cd097571356727280db48e46991f7d7f934a3c3b46cb4a0f326f66fa7a3a" => :catalina
    sha256 "bc73f2f613dc45ff786ac759cf2ead89d39c138777abc3727d445887f5f8d3b5" => :x86_64_linux
>>>>>>> 6253fe235cb05f1a710da8a70ab6cddddec71f1b
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
