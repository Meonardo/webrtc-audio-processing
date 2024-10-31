rm -fr builddir
rm -fr install

mkdir builddir
mkdir install

# -Dbuildtype=debug
# -Dbuildtype=debugoptimized default
# -Dbuildtype=release

# NOTICE:
# 1. `rnnoise_path` is the path to the rnnoise library, you need to build it first;
# 2. `prefix` is the path to the install directory;
# 3. set `buildtype` to generate debug symbols so you can debug the library;

meson setup --cross-file android-cross-arm64.txt builddir --prefix /home/meonardo/Android/android-project/webrtc-audio-processing/install -Drnnoise_path=/home/meonardo/Android/rnnoise/install -Dbuildtype=debug

meson compile -C builddir/

cd builddir

meson install