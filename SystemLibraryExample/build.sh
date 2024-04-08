cd libfoo
./build.sh
cd ..
scd archive \
        --type android \
        -Xcc -Ilibfoo/include \
        --platform android-arm64-v8a -Xlinker:android-arm64-v8a -Llibfoo/build/android-arm64-v8a --embed-library:android-arm64-v8a=libfoo/build/android-arm64-v8a/libfoo.so \
        --platform android-armeabi-v7a -Xlinker:android-armeabi-v7a -Llibfoo/build/android-armeabi-v7a --embed-library:android-armeabi-v7a=libfoo/build/android-armeabi-v7a/libfoo.so \
        --platform android-x86_64 -Xlinker:android-x86_64 -Llibfoo/build/android-x86_64 --embed-library:android-x86_64=libfoo/build/android-x86_64/libfoo.so \
        --platform android-x86 -Xlinker:android-x86 -Llibfoo/build/android-x86 --embed-library:android-x86=libfoo/build/android-x86/libfoo.so

