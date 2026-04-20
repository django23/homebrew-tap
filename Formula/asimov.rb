class Asimov < Formula
  desc "Exclude development dependencies from Time Machine backups"
  homepage "https://github.com/django23/asimov"
  url "https://github.com/django23/asimov/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "cccdf0701aab07d3d0331b860bd4bc0eca6e16e7157e4ed65fd236cf79f40cf1"
  license "MIT"
  version "0.6.0"

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
