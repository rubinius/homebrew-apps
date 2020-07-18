require 'formula'

class Rubinius27 < Formula
  homepage 'http://rubinius.com/'
  url 'https://rubinius-binaries-rubinius-com.s3.amazonaws.com/homebrew/rubinius-2.7.tar.bz2'
  sha256 '187a08446c066051f52e3918d95d425a8f6c588001a1fdf5372b1ea6b6705fc9'

  depends_on 'libyaml'

  depends_on :arch => :x86_64
  depends_on :macos => :yosemite

  keg_only "Conflicts with MRI (Matz's Ruby Implementation)."

  def install
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]
    include.install Dir["include/*"]
    man1.install Dir["man/man1/*"]
  end

  test do
    assert_equal 'rbx', `"#{bin}/rbx" -e "puts RUBY_ENGINE"`.chomp
  end
end
