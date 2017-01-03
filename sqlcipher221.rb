require 'formula'

class Sqlcipher221 < Formula
  homepage "http://sqlcipher.net"
  url 'https://github.com/sqlcipher/sqlcipher/archive/v2.2.1.tar.gz'
  sha256 '5432585796b9d83aaf2c3016c173ab17cec07337cb65afae74edf952dfb4aa92'

  head "https://github.com/sqlcipher/sqlcipher.git", :tag => 'v2.2.1'

  keg_only "SQLCipher conflicts with the system and Homebrew SQLites."

  def install
    system "./configure", "--prefix=#{prefix}", "--enable-tempstore=yes",
                          "CFLAGS=-DSQLITE_HAS_CODEC -DSQLITE_ENABLE_FTS3 -DSQLITE_ENABLE_FTS3_PARENTHESIS -I/usr/local/opt/openssl/include -L/usr/local/opt/openssl/lib", "LDFLAGS=-lcrypto",
                          "--disable-tcl"
    system "make"
    system "make install"
  end
end
