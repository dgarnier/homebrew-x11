class Xspringies < Formula
  homepage "http://www.cs.rutgers.edu/~decarlo/software.html"
  url "http://www.cs.rutgers.edu/~decarlo/software/xspringies-1.12.tar.Z"
  sha1 "7898352b444f7eca8ad90a609330935b7eafa1c2"

  depends_on :x11

  def install
    inreplace "Makefile.std" do |s|
      s.change_make_var! "LIBS", "-L#{MacOS::X11.lib} -lm -lX11"
      s.gsub! "mkdirhier", "mkdir -p"
    end
    system "make", "-f", "Makefile.std", "DDIR=#{prefix}/", "MANDIR=#{man1}", "install"
    mv "#{man1}/xspringies.man", "#{man1}/xspringies.1"
  end
end
