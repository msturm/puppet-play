require 'formula'

class Play12 < Formula
  homepage 'http://www.playframework.org/'
  url 'http://downloads.typesafe.com/play/1.2.7/play-1.2.7.zip'
  sha1 '436739d9f7cc00567a7e4245413c9c1ebf886797'
  version '1.2.5-boxen1'  
  keg_only 'we will create the links ourselves'

  def install
    rm_rf 'python' # we don't need the bundled Python for windows
    rm Dir['*.bat']
    libexec.install Dir['*']
    bin.mkpath
    ln_s libexec+'play', bin
  end
end
