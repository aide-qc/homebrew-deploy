class Qcor < Formula
  desc "quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "4585be59069e76b878196d8cc6e34f43c8a3cfbd8c239b940493b6232f0633b2"                                                                                        
  license "BSD-3"

  depends_on "llvm-csp"
  depends_on "xacc"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "91d5f6009102044efc459f5515606d30ef7092f938f299b781baba3029d0229b" => :mojave
    sha256 "8e2bbea3a8e22bb7ee9f633d1af2f8d201eef33abfa46a9f8948e552d3e098e2" => :catalina
    sha256 "c35349af0c894799bbcb40549c0342e0618acc21206c71a217fc6b9e7bb26d51" => :x86_64_linux                                                     
  end

  def install
    out = `python3 -c "import platform; print(platform.version().split('.')[0][-2:])"`
    out.delete!("\n")
    args = %W[
      -DCMAKE_BUILD_TYPE=Release
      -DCMAKE_CXX_COMPILER=#{HOMEBREW_PREFIX}/opt/gcc@10/bin/g++-10
      -DCMAKE_C_COMPILER=#{HOMEBREW_PREFIX}/opt/gcc@10/bin/gcc-10
      -DXACC_DIR=#{HOMEBREW_PREFIX}/opt/xacc
      -DLLVM_ROOT=#{HOMEBREW_PREFIX}/opt/llvm-csp 
    ]

    if OS.mac?
      args += %W[
       -DQCOR_EXTRA_HEADERS="#{HOMEBREW_PREFIX}/opt/gcc@10/include/c++/10.2.0;#{HOMEBREW_PREFIX}/opt/gcc@10/include/c++/10.2.0/x86_64-apple-darwin#{out}"
       -DGCC_STDCXX_PATH=#{HOMEBREW_PREFIX}/opt/gcc@10/lib/gcc/10
      ]
    end
    
    qcorpath = buildpath
    mkdir qcorpath/"build" do
       system "cmake", "..", *(std_cmake_args + args)
       system "cmake", "--build", ".", "--target", "install"
    end
  end
end
