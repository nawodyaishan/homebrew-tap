cask "agentic-sdd" do
  version "0.14.0"
  sha256 "615302ee8a8aacc34d0baedd5e7903ecdaa8625f2a657046aed49b2f1a997050"

  url "https://github.com/nawodyaishan/agentic-sdd/releases/download/v0.14.0/agentic-sdd_0.14.0_darwin_all.tar.gz"
  name "agentic-sdd"
  desc "Spec-driven development workflow skills, kept in sync across Codex, Claude Code, and Antigravity CLI"
  homepage "https://github.com/nawodyaishan/agentic-sdd"
  license "MIT"

  binary "asdx"
  binary "asdx-core"
  binary "agentic-sdd"
  binary "agentic-sdd-tui"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/asdx"]
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/asdx-core"]
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/agentic-sdd"]
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/agentic-sdd-tui"]
    end
  end
end
