require 'formula'

class Rubinius27 < Formula
  homepage 'http://rubinius.com/'
  url 'https://rubinius-binaries-rubinius-com.s3.amazonaws.com/homebrew/rubinius-2.7.tar.bz2'
  sha1 'e3bc415b8dd8b1a7386535a1a1c8934db3d24f0a'

  depends_on 'libyaml'

  depends_on :arch => :x86_64
  depends_on MinimumMacOSRequirement => :mountain_lion

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
