cd sqlite3
./build.sh
cd ..
scd archive --type android \
        -Xcc -Isqlite3/build/include \
        --platform android-arm64-v8a -Xlinker:android-arm64-v8a -Lsqlite3/build/android-arm64-v8a --embed-library:android-arm64-v8a=sqlite3/build/android-arm64-v8a/libsqlite3.so \
        --platform android-armeabi-v7a -Xlinker:android-armeabi-v7a -Lsqlite3/build/android-armeabi-v7a --embed-library:android-armeabi-v7a=sqlite3/build/android-armeabi-v7a/libsqlite3.so \
        --platform android-x86_64 -Xlinker:android-x86_64 -Lsqlite3/build/android-x86_64 --embed-library:android-x86_64=sqlite3/build/android-x86_64/libsqlite3.so \
        --platform android-x86 -Xlinker:android-x86 -Lsqlite3/build/android-x86 --embed-library:android-x86=sqlite3/build/android-x86/libsqlite3.so
