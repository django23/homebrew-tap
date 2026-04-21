class Asimov < Formula
  desc "Exclude development dependencies from Time Machine backups"
  homepage "https://github.com/django23/asimov"
  url "https://github.com/django23/asimov/archive/refs/tags/v0.6.3.tar.gz"
  sha256 "99ba9848a7b44ac4ae2c61bc71603e02a9ba305089344fbad5ac8fdcaedec9ed"
  license "MIT"
  version "0.6.3"

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
