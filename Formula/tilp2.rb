class Tilp2 < Formula
  desc "TI graphing calculator link/transfer program"
  homepage "http://lpg.ticalc.org/prj_tilp/"
  url "https://www.ticalc.org/pub/unix/tilp.tar.gz"
  version "1.18"
  head "https://github.com/debrouxl/tilp_and_gfm", :using => :git
  sha256 "6ba834f7fdbbce9818ccaa864222aed2d1688b210e9ff2c59576d1fde5159cd7"
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "intltool" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "gtk+"
  depends_on "libticalcs2"
  depends_on "gfm" => :optional

  def install
    Dir.chdir("tilp/trunk") if build.head?
    mkdir "m4"
    system "autoreconf", "-fi"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  patch do
    url "https://aur.archlinux.org/cgit/aur.git/plain/remove-broken-kde-support.patch?h=tilp&id=3cceb1cf63915cab77d205cdd6b7a2b01519d983"
    sha256 "f659d7eae872f6448b7f0e7317e34c6a0c1c0b5d984f80d502bc660bad7819f4"
  end

  test do
    system "false"
  end
end
