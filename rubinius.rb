require 'formula'

class Rubinius < Formula
  homepage 'http://rubinius.com/'
  url 'https://rubinius-releases-rubinius-com.s3.amazonaws.com/rubinius-3.54.tar.bz2'
  sha256 '2498a4c04feafba72d14c12e33ef881ae4bd8d3ccaa9bddcc8aec8acbad780fb'

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
