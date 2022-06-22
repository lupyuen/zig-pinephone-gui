# Zig GUI App for PinePhone

Can we build a Zig GUI App for PinePhone with zgt?

https://github.com/zenith391/zgt

Let's find out!

# Install Zig Compiler

On PinePhone, download the latest Zig Compiler `zig-linux-aarch64` from...

https://ziglang.org/download/

```bash
## Download the Zig Compiler
curl -O -L https://ziglang.org/builds/zig-linux-aarch64-0.10.0-dev.2674+d980c6a38.tar.xz

## Extract the Zig Compiler
tar xf zig-linux-aarch64-0.10.0-dev.2674+d980c6a38.tar.xz

## Add to PATH. TODO: Also add this line to ~/.bashrc, remember to change $PWD
export PATH="$PWD/zig-linux-aarch64-0.10.0-dev.2674+d980c6a38:$PATH"

## Test the Zig Compiler, should show "0.10.0-dev.2674+d980c6a38"
zig version
```

![Zig Compiler on PinePhone](https://lupyuen.github.io/images/GridArt_20220622_102635788~2.jpg)

# Install Zigmod

Download the latest [Zigmod Package Manager](https://nektro.github.io/zigmod/) from...

https://github.com/nektro/zigmod/releases

```bash
## Download Zigmod Package Manager
curl -O -L https://github.com/nektro/zigmod/releases/download/r80/zigmod-aarch64-linux

## Make it executable
chmod +x zigmod-aarch64-linux 

## Move it to the Zig Compiler directory
mv zigmod-aarch64-linux zig-linux-aarch64-0.10.0-dev.2674+d980c6a38/zigmod

## Test Zigmod, should show "zigmod r80 linux aarch64 musl"
zigmod
```

# Build The App

To build the app on PinePhone...

```bash
## Download the Source Code
git clone --recursive https://github.com/lupyuen/zig-pinephone-gui
cd zig-pinephone-gui

## Install the dependencies for zgt library
pushd libs/zgt
zigmod fetch
popd

## Build the app
zig build
```

[(See the Build Log)](https://gist.github.com/lupyuen/a44bc3faaf6d674d2b227aeb992ccfb8)

# Run The App

To run the app on PinePhone...

```zig
zig-out/bin/zig-pinephone-gui
```

When we tap the `Run` and `Save` buttons, we should see...

```text
info: You clicked button with text Run
info: You clicked button with text Save
```

Yep we have successfully built a Zig GUI App for PinePhone with zgt! 🎉

# VSCode Remote

For convenience, we may use VSCode Remote to do Remote Development with PinePhone...

https://code.visualstudio.com/docs/remote/remote-overview

![VSCode Remote on PinePhone](https://lupyuen.github.io/images/Screenshot%202022-06-22%20at%209.49.10%20AM~2.png)
