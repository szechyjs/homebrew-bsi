require "formula"

class Dal < Formula
  homepage 'http://brilligent.com'
  head 'https://brilligent.kilnhg.com/Code/MARRTS/DMS/dal-mainline.git'

  depends_on 'cmake' => :build
  depends_on 'boost' => :build
  depends_on 'thrift' => :build
  depends_on 'rabbitmq-c' => :build
  depends_on 'dal-services'

  def install
    mkdir 'build' do
      system "cmake", "..", *std_cmake_args
      system "make"
      system "make install"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test marrts`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
