ANDROID_NDK=~/Library/Android/sdk/ndk/25.2.9519653
SQLITE_NAME=sqlite-amalgamation-3450200
SQLITE_LINK=https://www.sqlite.org/2024/$SQLITE_NAME.zip

rm -Rf build
mkdir build
mkdir build/src
mkdir build/include

curl --output build/src/sqlite.zip $SQLITE_LINK
cd build/src
unzip sqlite.zip
cd ../..
cp build/src/$SQLITE_NAME/sqlite3.c build/src
cp build/src/$SQLITE_NAME/sqlite3.h build/include

mkdir build/sqlite3.xcframework
cp Info.plist build/sqlite3.xcframework

mkdir build/android-arm64-v8a
cd build/android-arm64-v8a
cmake -DCMAKE_TOOLCHAIN_FILE=../../android.toolchain.cmake -DANDROID_NDK=${ANDROID_NDK} -DCMAKE_ANDROID_ARCH_ABI=arm64-v8a ../.. -DCMAKE_BUILD_TYPE=Release
make
cd ../..
mkdir build/sqlite3.xcframework/android-arm64-v8a
mkdir build/sqlite3.xcframework/android-arm64-v8a/Headers
cp build/include/sqlite3.h build/sqlite3.xcframework/android-arm64-v8a/Headers
cp module.modulemap build/sqlite3.xcframework/android-arm64-v8a/Headers
cp build/android-arm64-v8a/libsqlite3.so build/sqlite3.xcframework/android-arm64-v8a

mkdir build/android-armeabi-v7a
cd build/android-armeabi-v7a
cmake -DCMAKE_TOOLCHAIN_FILE=../../android.toolchain.cmake -DANDROID_NDK=${ANDROID_NDK} -DCMAKE_ANDROID_ARCH_ABI=armeabi-v7a ../.. -DCMAKE_BUILD_TYPE=Release
make
cd ../..
mkdir build/sqlite3.xcframework/android-armeabi-v7a
mkdir build/sqlite3.xcframework/android-armeabi-v7a/Headers
cp build/include/sqlite3.h build/sqlite3.xcframework/android-armeabi-v7a/Headers
cp module.modulemap build/sqlite3.xcframework/android-armeabi-v7a/Headers
cp build/android-armeabi-v7a/libsqlite3.so build/sqlite3.xcframework/android-armeabi-v7a
mkdir build/sqlite3/lib/android-armeabi-v7a
cp build/android-armeabi-v7a/libsqlite3.so build/sqlite3/lib/android-arm64-v8a

mkdir build/android-x86_64
cd build/android-x86_64
cmake -DCMAKE_TOOLCHAIN_FILE=../../android.toolchain.cmake -DANDROID_NDK=${ANDROID_NDK} -DCMAKE_ANDROID_ARCH_ABI=x86_64 ../.. -DCMAKE_BUILD_TYPE=Release
make
cd ../..
mkdir build/sqlite3.xcframework/android-x86_64
mkdir build/sqlite3.xcframework/android-x86_64/Headers
cp build/include/sqlite3.h build/sqlite3.xcframework/android-x86_64/Headers
cp module.modulemap build/sqlite3.xcframework/android-x86_64/Headers
cp build/android-x86_64/libsqlite3.so build/sqlite3.xcframework/android-x86_64

mkdir build/android-x86
cd build/android-x86
cmake -DCMAKE_TOOLCHAIN_FILE=../../android.toolchain.cmake -DANDROID_NDK=${ANDROID_NDK} -DCMAKE_ANDROID_ARCH_ABI=x86 ../.. -DCMAKE_BUILD_TYPE=Release
make
cd ../..
mkdir build/sqlite3.xcframework/android-x86
mkdir build/sqlite3.xcframework/android-x86/Headers
cp build/include/sqlite3.h build/sqlite3.xcframework/android-x86/Headers
cp module.modulemap build/sqlite3.xcframework/android-x86/Headers
cp build/android-x86/libsqlite3.so build/sqlite3.xcframework/android-x86

