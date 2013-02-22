require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
#
# TEOS-10 V3.0 GSW Oceanographic Toolbox in C
# 

class Libteos10 < Formula
  homepage ''
  url 'https://github.com/lukecampbell/gsw-teos/tarball/v3.0r3'
  homepage 'http://www.teos-10.org/'
  version '3.0'
  sha1 'de7922fba167fff6cdcb5ba27ade5024424ab641'

  depends_on 'autoconf'
  depends_on 'automake'
  depends_on 'libtool'


  def install

    system "bash ./autogen.sh"
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    system "#{prefix}/bin/gsw_check_functions"
  end
end
