class Qcor < Formula
  desc "quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "0b6d1dddf46948483a2b1bb67e820a48da5172529b13a408e0909ba28288c713"                                                                        
  license "BSD-3"

  depends_on "llvm-csp"
  depends_on "xacc"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "e8a855c0d8b8eb940fd7a804eb794ec3ddb2e32fc2a175b29c0cba48197c1b5c" => :mojave
    sha256 "77ef89d3931c950be1c8682f6a3127613ca5861a677267e7461823f4474501bc" => :catalina
    sha256 "b2282f36e8707a5ab49ed1233a1546f7c3dd400a37f28f18d23bbc67f280c724" => :x86_64_linux                
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
