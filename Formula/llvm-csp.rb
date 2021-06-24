class LlvmCsp < Formula
  desc "Clang syntax handler"
  homepage "https://github.com/hfinkel/llvm-project-csp"
  url "https://github.com/ornl-qci/llvm-project-csp/tarball/csplugin"
  version "1.0.0"
  sha256 "82647e71d2743d3fcbfd0627b3bb8cd7bd1a8baf83d218691f443ca90b85da40"
  license "Apache 2.0"

  bottle do
    root_url "https://github.com/ORNL-QCI/llvm-project-csp/releases/download/1.0.0"
    sha256 mojave:       "10182d37cde6312a2ca28d89c50b2198b48d90d8ba14cb3bc18ec49379ff5039"
    sha256 catalina:     "fdb817df99b8e56e89fafe5e9d34194463a17d8279c35b25c4ff2d0f3c229fe6"
    sha256 x86_64_linux: "4a7c6a6d207de796f307cdabde51862b656bf535e8e41625db93e9f861672934"
  end

  depends_on "cmake" => :build
  depends_on "ninja" => :build

  def install
    projects = %w[
      clang
      mlir
    ]

    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    args = %W[
      -DBUILD_SHARED_LIBS=ON
      -DCMAKE_BUILD_TYPE=Release
      -DLLVM_TARGETS_TO_BUILD=X86
      -DLLVM_ENABLE_DUMP=ON
      -DLLVM_ENABLE_PROJECTS=#{projects.join(";")}
      -DCMAKE_INSTALL_PREFIX=#{prefix}
      -G Ninja
    ]

    llvmpath = buildpath
    mkdir llvmpath/"build" do
      system "cmake", "../llvm", *args
      system "cmake", "--build", ".", "--target", "install"
    end
  end
end
