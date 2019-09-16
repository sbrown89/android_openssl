# android_openssl
OpenSSL scripts and bins for Android (useful for Qt on Android apps)

In this repo you can find prebuilt openssl libs for Android and a qmake `.pri` file.

The following branches/tag(s) are available
* `master` : Use for Qt 5.12.4+ and 5.13.x

To add openssl in your qmake project just add:
```
include(<path/to/android_openssl/openssl.pri)
```
to your `.pro` file
