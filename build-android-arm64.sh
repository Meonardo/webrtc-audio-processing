rm -fr builddir
rm -fr install

mkdir builddir
mkdir install

meson setup --cross-file android-cross-arm64.txt builddir --prefix /home/meonardo/Android/android-project/webrtc-audio-processing/install

meson compile -C builddir/

cd builddir

meson install