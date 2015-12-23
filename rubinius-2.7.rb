require 'formula'

class Rubinius27 < Formula
  homepage 'http://rubinius.com/'
  url 'https://rubinius-binaries-rubinius-com.s3.amazonaws.com/homebrew/rubinius-2.7.tar.bz2'
  sha1 '81aa874d5af72550fff1e96ccbfd8b923035d1fd'

  depends_on 'libyaml'

  depends_on :arch => :x86_64
  depends_on MinimumMacOSRequirement => :mountain_lion

  keg_only "Conflicts with MRI (Matz's Ruby Implementation)."

  test do
    assert_equal 'rbx', `"#{bin}/rbx" -e "puts RUBY_ENGINE"`.chomp
  end
end
