require 'formula'

class Rubinius < Formula
  homepage 'http://rubini.us/'
  url 'https://downloads-rubini-us.s3.amazonaws.com/homebrew/rubinius-2.5.1.tar.bz2'
  sha1 'c023e8db9e05b28f8c81895eedfe3b71e788a0b8'

  depends_on 'libyaml'

  depends_on :arch => :x86_64
  depends_on MinimumMacOSRequirement => :mountain_lion

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
