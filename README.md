# Zig GUI App for PinePhone

Can we build a Zig GUI App for PinePhone with zgt?

https://github.com/zenith391/zgt

Let's find out!

# Install Zig Compiler

On PinePhone, download the latest Zig Compiler `zig-linux-aarch64` from...

https://ziglang.org/download/

```bash
## Download the Zig Compiler
curl -O https://ziglang.org/builds/zig-linux-aarch64-0.10.0-dev.2674+d980c6a38.tar.xz

## Extract the Zig Compiler
tar xf zig-linux-aarch64-0.10.0-dev.2674+d980c6a38.tar.xz

## Add to PATH. TODO: Also add this line to ~/.bashrc, remember to change $PWD
export PATH="$PWD/zig-linux-aarch64-0.10.0-dev.2674+d980c6a38:$PATH"

## Test the Zig Compiler
zig
zig version
```

![Zig Compiler on PinePhone](https://lupyuen.github.io/images/GridArt_20220622_102635788~2.jpg)

# VSCode Remote

For convenience, we may use VSCode Remote to do Remote Development with PinePhone...

https://code.visualstudio.com/docs/remote/remote-overview

![VSCode Remote on PinePhone](https://lupyuen.github.io/images/Screenshot%202022-06-22%20at%209.49.10%20AM~2.png)

# TODO
