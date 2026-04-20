class Asimov < Formula
  desc "Exclude development dependencies from Time Machine backups"
  homepage "https://github.com/django23/asimov"
  url "https://github.com/django23/asimov/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"
  version "0.6.0"

  depends_on :macos

  def install
    bin.install "asimov"
    (prefix/"com.django23.asimov.plist").write <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>Label</key><string>com.django23.asimov</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/asimov</string>
        </array>
        <key>RunAtLoad</key><true/>
        <key>StartCalendarInterval</key>
        <dict>
          <key>Hour</key><integer>12</integer>
          <key>Minute</key><integer>0</integer>
        </dict>
      </dict>
      </plist>
    EOS
  end

  service do
    run [opt_bin/"asimov"]
    run_type :cron
    cron "0 12 * * *"
  end

  test do
    assert_match "asimov", shell_output("#{bin}/asimov --version")
  end
end
