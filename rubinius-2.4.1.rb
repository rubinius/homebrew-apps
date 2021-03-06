require 'formula'

class Rubinius241 < Formula
  homepage 'http://rubini.us/'
  url 'https://downloads-rubini-us.s3.amazonaws.com/homebrew/rubinius-2.4.1.tar.bz2'
  sha256 '5ed880b4cf5a995c05eba4bd57ca4624982cb924b27c67e71555548cfd86d7ce'

  depends_on 'libyaml'

  depends_on :arch => :x86_64
  depends_on :macos => :yosemite

  keg_only "Conflicts with MRI (Matz's Ruby Implementation)."

  def install
    # We must install chruby first because eg bin.install moves files.
    rbx = "rbx-#{version}"
    rubies = File.expand_path "~/.rubies"
    rubies_rbx = "#{rubies}/#{rbx}"

    if Dir.exist? rubies and not Dir.exist? rubies_rbx
      ohai "Installing for chruby..."
      mkdir_p rubies_rbx
      cp_r Dir["#{buildpath}/*"], rubies_rbx
    end

    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]
    include.install Dir["include/*"]
    man1.install Dir["man/man1/*"]
  end

  test do
    assert_equal 'rbx', `"#{bin}/rbx" -e "puts RUBY_ENGINE"`.chomp
  end
end
