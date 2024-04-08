ANDROID_NDK=~/Library/Android/sdk/ndk/25.2.9519653

rm -Rf build
mkdir build

mkdir build/foo.xcframework
cp Info.plist build/foo.xcframework

mkdir build/android-arm64-v8a
cd build/android-arm64-v8a
cmake -DCMAKE_TOOLCHAIN_FILE=../../android.toolchain.cmake -DANDROID_NDK=${ANDROID_NDK} -DCMAKE_ANDROID_ARCH_ABI=arm64-v8a ../.. -DCMAKE_BUILD_TYPE=Release
make
cd ../..
mkdir build/foo.xcframework/android-arm64-v8a
cp -RfP include build/foo.xcframework/android-arm64-v8a/Headers
cp build/android-arm64-v8a/libfoo.so build/foo.xcframework/android-arm64-v8a

mkdir build/android-armeabi-v7a
cd build/android-armeabi-v7a
cmake -DCMAKE_TOOLCHAIN_FILE=../../android.toolchain.cmake -DANDROID_NDK=${ANDROID_NDK} -DCMAKE_ANDROID_ARCH_ABI=armeabi-v7a ../.. -DCMAKE_BUILD_TYPE=Release
make
cd ../..
mkdir build/foo.xcframework/android-armeabi-v7a
cp -RfP include build/foo.xcframework/android-armeabi-v7a/Headers
cp build/android-armeabi-v7a/libfoo.so build/foo.xcframework/android-armeabi-v7a

mkdir build/android-x86_64
cd build/android-x86_64
cmake -DCMAKE_TOOLCHAIN_FILE=../../android.toolchain.cmake -DANDROID_NDK=${ANDROID_NDK} -DCMAKE_ANDROID_ARCH_ABI=x86_64 ../.. -DCMAKE_BUILD_TYPE=Release
make
cd ../..
mkdir build/foo.xcframework/android-x86_64
cp -RfP include build/foo.xcframework/android-x86_64/Headers
cp build/android-x86_64/libfoo.so build/foo.xcframework/android-x86_64

mkdir build/android-x86
cd build/android-x86
cmake -DCMAKE_TOOLCHAIN_FILE=../../android.toolchain.cmake -DANDROID_NDK=${ANDROID_NDK} -DCMAKE_ANDROID_ARCH_ABI=x86 ../.. -DCMAKE_BUILD_TYPE=Release
make
cd ../..
mkdir build/foo.xcframework/android-x86
cp -RfP include build/foo.xcframework/android-x86/Headers
cp build/android-x86/libfoo.so build/foo.xcframework/android-x86

