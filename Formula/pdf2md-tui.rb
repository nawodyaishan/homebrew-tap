# typed: false
# frozen_string_literal: true

class Pdf2mdTui < Formula
  desc "High-performance TUI tool for batch PDF to LLM-friendly Markdown conversion"
  homepage "https://github.com/nawodyaishan/pdf2md-tui"
  url "https://github.com/nawodyaishan/pdf2md-tui/archive/refs/tags/v1.3.4.tar.gz"
  sha256 "ddc5f0b8360e3eec3c549c5d765d37a115fd57a7083f8b041e1da9e92950a19f"
  license "MIT"
  version "1.3.4"

  depends_on "go" => :build

  def install
    build_date = Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")
    go_version = Utils.safe_popen_read("go", "version").split[2]
    ldflags = %W[
      -s -w
      -X github.com/nawodyaishan/pdf2md-tui/pkg/version.Version=#{version}
      -X github.com/nawodyaishan/pdf2md-tui/pkg/version.Commit=#{version}
      -X github.com/nawodyaishan/pdf2md-tui/pkg/version.Date=#{build_date}
      -X github.com/nawodyaishan/pdf2md-tui/pkg/version.GoVersion=#{go_version}
    ]

    system "go", "build", *std_go_args(ldflags: ldflags.join(" ")), "./cmd/pdf2md-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pdf2md-tui version")
  end
end
