class Qcor < Formula
  desc "quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "46faf3b1ed754b6c425c68e500703e0ac745b31cbd42010ed199db5ae889b8b6"                                                                             
  license "BSD-3"

  depends_on "llvm-csp"
  depends_on "xacc"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "17a3930532426ef39ae6f1760982b556ce84b023bca173eaf476e81e1f8220e3" => :mojave
    sha256 "aeb67357f89ca81dbab7c09c30a6cdecb3d34c843b45933067e60605775cb2ec" => :catalina
    sha256 "0c1044389595dda0392c8b649c6ec9ee1c521654c0a4b5cc04924cca409a587a" => :x86_64_linux                  
  end

  def install
    out = `python3 -c "import platform; print(platform.version().split('.')[0][-2:])"`
    args = %W[
      -DCMAKE_BUILD_TYPE=Release
      -DCMAKE_CXX_COMPILER=#{HOMEBREW_PREFIX}/opt/gcc@10/bin/g++-10
      -DCMAKE_C_COMPILER=#{HOMEBREW_PREFIX}/opt/gcc@10/bin/gcc-10
      -DXACC_DIR=#{HOMEBREW_PREFIX}/opt/xacc
      -DQCOR_EXTRA_HEADERS="#{HOMEBREW_PREFIX}/opt/gcc@10/include/c++/10.2.0;#{HOMEBREW_PREFIX}/opt/gcc@10/include/c++/10.2.0/x86_64-apple-darwin#{out}"
      -DGCC_STDCXX_PATH=#{HOMEBREW_PREFIX}/opt/gcc@10/lib/gcc/10
      -DLLVM_ROOT=#{HOMEBREW_PREFIX}/opt/llvm-csp 
      -G Ninja
    ]

    qcorpath = buildpath
    mkdir qcorpath/"build" do
       system "cmake", "..", *(std_cmake_args + args)
       system "cmake", "--build", ".", "--target", "install"
    end
  end
end
