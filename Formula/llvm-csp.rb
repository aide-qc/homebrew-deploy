class LlvmCsp < Formula
  desc "clang syntax handler"
  homepage "https://github.com/hfinkel/llvm-project-csp"
  url "https://github.com/ornl-qci/llvm-project-csp/tarball/csplugin"
  version "1.0.0"
  sha256 "82647e71d2743d3fcbfd0627b3bb8cd7bd1a8baf83d218691f443ca90b85da40"
  license "Apache 2.0"

  depends_on "cmake" => :build
  depends_on "ninja" => :build

  bottle do
    root_url "https://github.com/ORNL-QCI/llvm-project-csp/releases/download/1.0.0"
    sha256 "d49e9662a1ff7e88d3becf6e45264b611e9356ee1379ac874d646536751790a0" => :mojave
    sha256 "a528321df5dfe7d8928873f2410d01d98824b663eb38b7c6dbc98d5c164b6cfb" => :catalina
    sha256 "4a7c6a6d207de796f307cdabde51862b656bf535e8e41625db93e9f861672934" => :x86_64_linux
  end

  def install
    projects = %w[
      clang
      mlir
    ]

    ENV.libcxx if ENV.compiler == :clang

    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    args = %W[
      -DBUILD_SHARED_LIBS=ON
      -DCMAKE_BUILD_TYPE=Release
      -DCMAKE_C_FLAGS_RELEASE=-DNDEBUG
      -DCMAKE_CXX_FLAGS_RELEASE=-DNDEBUG
      -DLLVM_TARGETS_TO_BUILD=X86
      -DLLVM_INCLUDE_TESTS=OFF
      -DLLVM_ENABLE_DUMP=ON
      -DLLVM_INCLUDE_DOCS=OFF
      -DLLVM_ENABLE_PROJECTS=#{projects.join(";")}
      -DCMAKE_INSTALL_PREFIX=#{prefix}
      -G Ninja
    ]

    if MacOS.version == :mojave && MacOS::CLT.installed?
      # Mojave CLT linker via software update is older than Xcode.
      # Use it to retain compatibility.
      args << "-DCMAKE_LINKER=/Library/Developer/CommandLineTools/usr/bin/ld"
    end

    sdk = MacOS.sdk_path_if_needed
    args << "-DDEFAULT_SYSROOT=#{sdk}" if sdk
    args << "-DCMAKE_OSX_SYSROOT=#{sdk}" if sdk

    llvmpath = buildpath
    mkdir llvmpath/"build" do
       system "cmake", "../llvm", *(args)
       system "cmake", "--build", ".", "--target", "install"
    end
  end

end

