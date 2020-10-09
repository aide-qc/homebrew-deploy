class Qcor < Formula
  desc "quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "db7e48bb3628df7230e14b24668f7ba73bd7d5a4d88bfc942d6fa31ed8bd37fc"
  license "BSD-3"

  depends_on "cmake"
  depends_on "llvm-csp"
  depends_on "gcc@10"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "a7689d62e9f20b35aeaf2941eb24bd5be8579d264dad3d1355ced284cb872188" => :mojave
  end

  def install
    system "sh", "scripts/macosx/homebrew_build_xacc_and_qcor.sh", "#{prefix}", "cmake"
    mkdir buildpath/"build" do
      system "cmake", "--build", ".", "--target", "install"
    end
  end
  def caveats
    <<~EOS
      To use qcor, ensure that #{opt_prefix}/bin is in your PATH:
        export PATH=$PATH:#{opt_prefix}/bin 
    EOS
  end
end
