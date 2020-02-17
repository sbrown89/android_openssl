contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_EXTRA_LIBS += \
        $$PWD/arm/libcrypto.a \
        $$PWD/arm/libssl.a

    LIBS += \
        $$PWD/arm/libcrypto.a \
        $$PWD/arm/libssl.a
}

contains(ANDROID_TARGET_ARCH,arm64-v8a) {
    ANDROID_EXTRA_LIBS += \
        $$PWD/arm64/libcrypto.a \
        $$PWD/arm64/libssl.a

    LIBS += \
        $$PWD/arm64/libcrypto.a \
        $$PWD/arm64/libssl.a
}

contains(ANDROID_TARGET_ARCH,x86) {
    ANDROID_EXTRA_LIBS += \
        $$PWD/x86/libcrypto.a \
        $$PWD/x86/libssl.a

    LIBS += \
        $$PWD/x86/libcrypto.a \
        $$PWD/x86/libssl.a
}

contains(ANDROID_TARGET_ARCH,x86_64) {
    ANDROID_EXTRA_LIBS += \
        $$PWD/x86_64/libcrypto.a \
        $$PWD/x86_64/libssl.a

    LIBS += \
        $$PWD/x86_64/libcrypto.a \
        $$PWD/x86_64/libssl.a
}
