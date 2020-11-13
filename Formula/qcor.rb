class Qcor < Formula
  desc "quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "0e72e8083afed022f6fe525b1959988f5d4f43be7e7a36e1c88a6e24c60ab4b2"                                                                
  license "BSD-3"

  depends_on "llvm-csp"
  depends_on "xacc"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "861cf342b9243c25225a7a9bcf098046044846ec830ed2d543d90439531bc860" => :mojave
    sha256 "ce6b2fe02af696c50e9dbecbad674a2e9b5516b326a1b2cef69ec43f2bb6240d" => :catalina
    sha256 "eba9d1747aee29be6124404aa9d363d70a759fb0e97985bf259c697956b9477a" => :x86_64_linux          
  end

  def install

    args = %W[
      -DCMAKE_BUILD_TYPE=Release
      -DCMAKE_CXX_COMPILER=#{HOMEBREW_PREFIX}/opt/gcc@10/bin/g++-10
      -DCMAKE_C_COMPILER=#{HOMEBREW_PREFIX}/opt/gcc@10/bin/gcc-10
      -DXACC_DIR=#{HOMEBREW_PREFIX}/opt/xacc
      -DQCOR_EXTRA_HEADERS="#{HOMEBREW_PREFIX}/opt/gcc@10/include/c++/10.2.0;#{HOMEBREW_PREFIX}/opt/gcc@10/include/c++/10.2.0/#{%x[gcc -dumpmachine].sub('19.6.0','19').sub('18.7.0','18').strip()}"
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
