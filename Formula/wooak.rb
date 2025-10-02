class Wooak < Formula
  desc "A simple terminal UI for managing SSH connections"
  homepage "https://github.com/aryasoni98/wooak"
  url "https://github.com/aryasoni98/wooak/archive/v0.0.1.tar.gz"
  sha256 "ccd4708b8783366e23ba940d978be7fd21d8e9cbb9e0bbc92cf6868204b0f639"
  license "MIT"
  head "https://github.com/aryasoni98/wooak.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/main.go"
  end

  test do
    system "#{bin}/wooak", "--version"
  end
end
