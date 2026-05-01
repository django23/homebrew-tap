class Asimov < Formula
  desc "Exclude development dependencies from Time Machine backups"
  homepage "https://github.com/django23/asimov"
  url "https://github.com/django23/asimov/archive/refs/tags/v0.6.4.tar.gz"
  sha256 "ad385314dfa174937f278f4641f6449a07f7c1b072bc81697d758dde75b8188c"
  license "MIT"
  version "0.6.4"

  depends_on :macos

  def install
    bin.install "asimov"
  end

  service do
    run [opt_bin/"asimov"]
    run_type :interval
    interval 86_400
  end

  test do
    assert_match "asimov", shell_output("#{bin}/asimov --version")
  end
end
