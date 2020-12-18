class Qcor < Formula
  desc "quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "2c2ff311225364a14caa515ddd1d2bed34eb559ec4c3ca26042f6b754e110602"                                                                                       
  license "BSD-3"

  depends_on "llvm-csp"
  depends_on "xacc"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "b709c58ecf8e813e706330e1656713d882e3192e8d74b7ccc13aca19aa8af2f6" => :mojave
    sha256 "6a2de47d4271e363d0066b34d798178a8d0e99d777606974b2410cf3eab8a7ec" => :catalina
    sha256 "9f09651eef17c8f38930999e538c4c81180319befe1a3b8923dd35953be7776e" => :x86_64_linux                                          
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
