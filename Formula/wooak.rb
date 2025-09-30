class Wooak < Formula
  desc "A simple terminal UI for managing SSH connections"
  homepage "https://github.com/aryasoni98/wooak"
  url "https://github.com/aryasoni98/wooak/archive/v0.0.1.tar.gz"
  sha256 ""
  license "MIT"
  head "https://github.com/aryasoni98/wooak.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version} -X main.gitCommit=#{Utils.git_head}"), "./cmd/main.go"
  end

  test do
    system "#{bin}/wooak", "--version"
  end
end
