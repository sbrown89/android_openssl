contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    LIBS += \
        $$PWD/arm/libcrypto.a \
        $$PWD/arm/libssl.a
}

contains(ANDROID_TARGET_ARCH,arm64-v8a) {
    LIBS += \
        $$PWD/arm64/libcrypto.a \
        $$PWD/arm64/libssl.a
}

contains(ANDROID_TARGET_ARCH,x86) {
    LIBS += \
        $$PWD/x86/libcrypto.a \
        $$PWD/x86/libssl.a
}

contains(ANDROID_TARGET_ARCH,x86_64) {
    LIBS += \
        $$PWD/x86_64/libcrypto.a \
        $$PWD/x86_64/libssl.a
}
