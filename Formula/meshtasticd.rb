class Meshtasticd < Formula
  desc "Meshtastic Node software for MacOS"
  homepage "https://github.com/meshtastic/firmware"
  # Use a commit hash from `master` where MacOS support is present.
  url "https://github.com/meshtastic/firmware/archive/9c72767c0133361131f27ca039455a81ec8d4a1e.tar.gz"
  version "2.7.23"
  sha256 "c0fa5e88ab038e3b98b64eb5c8c7c45e2b724055d45cb98eea4bc194a7ab50ed"
  license "GPL-3.0-only"
  head "https://github.com/meshtastic/firmware.git", branch: "master"

  # Only support MacOS 15+
  depends_on macos: :sequoia
  # Only support Apple Silicon (ARM64) architecture
  depends_on arch: :arm64
  depends_on "platformio" => :build
  depends_on "pkgconf" => :build
  depends_on "yaml-cpp"
  depends_on "libuv"
  depends_on "openssl@3"
  depends_on "libusb"
  depends_on "argp-standalone"
  # depends_on "ulfius"

  def install
    system "platformio", "run", "-e", "native-macos"
    bin.install ".pio/build/native-macos/meshtasticd"
  end

#   # The test will check if meshtasticd can be executed.
#   # It will also check if the version is correctly displayed.
#   test do
#     assert_match version.to_s, shell_output("#{bin}/meshtasticd -v")
#   end
end
