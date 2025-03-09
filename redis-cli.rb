class RedisCli < Formula
  desc "Install the redis-cli only."
  homepage "https://github.com/fvj/homebrew-redis-cli"
  version "7.4.2"
  sha256 "199ebc73ff858ae3ac122ebea7e483d5da0c1ee2f1de73b6404d4780036e9474"
  url "https://github.com/antirez/redis/archive/#{version}.tar.gz"

  def install
    system "make redis-cli"
    bin.install "./src/redis-cli"
  end

  test do
    system "#{bin}/redis-cli"
  end
end
