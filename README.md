## Install Dependencies
You can install the Curses library using Homebrew:
```
brew install ncurses cmake openssl libsodium readline
```

## Create a Build Directory
```
mkdir -p build
cd build
```

## Set CMake Variables
You might need to specify the path to the Curses library and include directory explicitly. You can do this by adding these flags to your CMake command:

```
cmake . -G Xcode \
    -DCMAKE_TOOLCHAIN_FILE=../ios-cmake/ios.toolchain.cmake \
    -DPLATFORM=OS64COMBINED \
    -DCMAKE_INCLUDE_PATH=$(brew --prefix ncurses)/include \
    -DCMAKE_LIBRARY_PATH=$(brew --prefix ncurses)/lib
```
