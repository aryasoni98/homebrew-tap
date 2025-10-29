class Wooak < Formula
  desc "A simple terminal UI for managing SSH connections"
  homepage "https://github.com/aryasoni98/wooak"
  url "https://github.com/aryasoni98/wooak/archive/v0.0.2.tar.gz"
  sha256 "ad4e841246e8c620673be7e381c4e44cac895213bed8b0a00924d73ce4873cc9"
  license "MIT"
  head "https://github.com/aryasoni98/wooak.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/main.go"
  end

  test do
    assert_match "Wooak version", shell_output("#{bin}/wooak --version")
  end
end
