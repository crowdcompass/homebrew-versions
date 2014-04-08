require 'formula'

class Sqlcipher221 < Formula
  homepage "http://sqlcipher.net"
  url 'https://github.com/sqlcipher/sqlcipher/archive/v2.2.1.tar.gz'
  sha1 'dc8af219f71ddae63ed7caf9cff5c0e9b00c3f13'

  head "https://github.com/sqlcipher/sqlcipher.git", :tag => 'v2.2.1'

  keg_only "SQLCipher conflicts with the system and Homebrew SQLites."

  def install
    system "./configure", "--prefix=#{prefix}", "--enable-tempstore=yes",
                          "CFLAGS=-DSQLITE_HAS_CODEC", "LDFLAGS=-lcrypto",
                          "--disable-tcl"
    system "make"
    system "make install"
  end
end
