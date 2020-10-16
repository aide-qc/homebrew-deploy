class Qcor < Formula
  desc "quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "77861d537fc8b94704e230e148fcd991a19f4ee52fbbbc0e1c084e67a44f6f07"     
  license "BSD-3"

  depends_on "llvm-csp"
  depends_on "xacc"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "b7eb396396fa47b2f0a22ea994c36dfabb1d04b7902c6e76269caa537077bd6f" => :mojave
    sha256 "ba73135e551922fad8e75a03b79320b768397f2ae296569d0e3fccbfc457a7e6" => :x86_64_linux   
  end

  def install
    args = %W[
      -DCMAKE_BUILD_TYPE=Release
      -DCMAKE_CXX_COMPILER=#{HOMEBREW_PREFIX}/opt/gcc@10/bin/g++-10
      -DCMAKE_C_COMPILER=#{HOMEBREW_PREFIX}/opt/gcc@10/bin/gcc-10
      -DXACC_DIR=#{HOMEBREW_PREFIX}/opt/xacc
      -DQCOR_EXTRA_HEADERS="#{HOMEBREW_PREFIX}/opt/gcc@10/include/c++/10.2.0;#{HOMEBREW_PREFIX}/opt/gcc@10/include/c++/10.2.0/x86_64-apple-darwin18"
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
