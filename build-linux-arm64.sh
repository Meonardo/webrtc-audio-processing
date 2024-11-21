set -e

# get target from input parameter
# target aarch64-linux
target=$1

if [ -z $target ]; then
    echo "Usage: $0 <target>"
    exit 1
fi

# check target
if [ $target != "aarch64-linux" ]; then
    echo "Error: target must be aarch64-linux"
    exit 1
fi

echo "target: $target"

# set target environment
cross_file=linux-cross-arm64.txt

rm -fr builddir
rm -fr install/${target}

mkdir builddir
mkdir install/${target}

# -Dbuildtype=debug
# -Dbuildtype=debugoptimized [default: -g -o2, debug symbols not stripped]
# -Dbuildtype=release

# NOTICE:
# 1. `rnnoise_path` is the path to the rnnoise library, you need to build it first;
# 2. `prefix` is the path to the install directory;
# 3. set `buildtype=debug` generate debug symbols so you can debug the library;

meson setup builddir --cross-file $cross_file --prefix /home/meonardo/Android/android-project/webrtc-audio-processing/install/${target} -Dbuildtype=release

meson compile -C builddir/

cd builddir

meson install