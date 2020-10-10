class Qcor < Formula
  desc "quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "21cee506769e4cf0d94228f4938f6098214334121f03307f348e3f8d5e71a8a4"
  license "BSD-3"

  depends_on "llvm-csp"
  depends_on "xacc"
  depends_on "gcc@10"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "2d33182ef13d08b03bec30c42185d073e240506ff4116b13d8e2e12508340036" => :mojave
  end

  def install
    args = %W[
      -DCMAKE_BUILD_TYPE=Release
      -DCMAKE_CXX_COMPILER=/usr/local/opt/gcc/bin/g++-10
      -DCMAKE_C_COMPILER=/usr/local/opt/gcc/bin/gcc-10
      -DXACC_DIR=#{prefix}
      -DQCOR_EXTRA_HEADERS="/usr/local/opt/gcc/include/c++/10.2.0;/usr/local/opt/gcc/include/c++/10.2.0/x86_64-apple-darwin18"
      -DGCC_STDCXX_PATH=/usr/local/opt/gcc/lib/gcc/10
      -DLLVM_ROOT=/usr/local/opt/llvm-csp 
      -G Ninja
    ]

    qcorpath = buildpath
    mkdir qcorpath/"build" do
       system "cmake", "..", *(std_cmake_args + args)
       system "cmake", "--build", ".", "--target", "install"
    end
  end
end
