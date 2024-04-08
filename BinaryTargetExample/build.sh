cd libfoo
./build.sh
cd ..
scd archive \
        --type android \
        --platform android-arm64-v8a \
        --platform android-armeabi-v7a \
        --platform android-x86_64 \
        --platform android-x86
