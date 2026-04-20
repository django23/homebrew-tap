class Asimov < Formula
  desc "Exclude development dependencies from Time Machine backups"
  homepage "https://github.com/django23/asimov"
  url "https://github.com/django23/asimov/archive/refs/tags/v0.6.2.tar.gz"
  sha256 "f1cb37c2d9ae272a11f667cabdcae96e228280d383a191a57e49719a9a2e5e4b"
  license "MIT"
  version "0.6.2"

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
