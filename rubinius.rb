require 'formula'

class Rubinius < Formula
  homepage 'http://rubinius.com/'
  url 'https://rubinius-releases-rubinius-com.s3.amazonaws.com/rubinius-3.55.tar.bz2'
  sha256 'fe7671beb3f36b987e02933afb392123b4c0a8ac15909a7b774d26101fec1ac1'

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
