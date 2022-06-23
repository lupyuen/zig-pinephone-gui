![Zig GUI App for PinePhone](https://lupyuen.github.io/images/PXL_20220622_061922131~2.jpg)

# Zig GUI App for PinePhone

[__Follow the updates on Twitter__](https://twitter.com/MisterTechBlog/status/1539782929114484736)

Can we build a Zig GUI App for PinePhone with the zgt library?

https://github.com/zenith391/zgt

Let's find out!

[(More about Zig)](https://ziglang.org)

# Install Zig Compiler

On PinePhone, download the latest Zig Compiler `zig-linux-aarch64` from...

https://ziglang.org/download/

```bash
## Download the Zig Compiler
curl -O -L https://ziglang.org/builds/zig-linux-aarch64-0.10.0-dev.2674+d980c6a38.tar.xz

## Extract the Zig Compiler
tar xf zig-linux-aarch64-0.10.0-dev.2674+d980c6a38.tar.xz

## Add to PATH. TODO: Also add this line to ~/.bashrc
export PATH="$HOME/zig-linux-aarch64-0.10.0-dev.2674+d980c6a38:$PATH"

## Test the Zig Compiler, should show "0.10.0-dev.2674+d980c6a38"
zig version
```

![Zig Compiler on PinePhone](https://lupyuen.github.io/images/GridArt_20220622_102635788~2.jpg)

_Will Zig Compiler run on any PinePhone?_

I tested the Zig Compiler with Manjaro Phosh on PinePhone (pic above), but it will probably work on any PinePhone distro since the Zig Compiler is a self-contained Arm64 Binary.

[(Zig Compiler works with Mobian on PinePhone too)](https://twitter.com/techneo/status/1539510460726509568)

# Install Zigmod

Download the latest [Zigmod Package Manager](https://nektro.github.io/zigmod/) `zigmod-aarch64-linux` from...

https://github.com/nektro/zigmod/releases

```bash
## Download Zigmod Package Manager
curl -O -L https://github.com/nektro/zigmod/releases/download/r80/zigmod-aarch64-linux

## Make it executable
chmod +x zigmod-aarch64-linux 

## Move it to the Zig Compiler directory, rename as zigmod
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

```bash
zig-out/bin/zig-pinephone-gui
```

We should see the screen below.

When we tap the `Run` and `Save` buttons, we should see...

```text
info: You clicked button with text Run
info: You clicked button with text Save
```

Yep we have successfully built a Zig GUI App for PinePhone with zgt! 🎉

![Zig GUI App for PinePhone](https://lupyuen.github.io/images/PXL_20220622_061922131~2.jpg)

# Inside The App

Here's the source code for the app: [`src/main.zig`](src/main.zig)

```zig
// Import the zgt library and Zig Standard Library
const zgt = @import("zgt");
const std = @import("std");

/// Main Function for our app
pub fn main() !void {
    // Init the zgt library
    try zgt.backend.init();

    // Fetch the Window
    var window = try zgt.Window.init();

    // Set the Window Contents
    try window.set(
        // One Column of Widgets
        zgt.Column(.{}, .{
            // Top Row of Widgets
            zgt.Row(.{}, .{
                // Save Button
                zgt.Button(.{ .label = "Save", .onclick = buttonClicked }),
                // Run Button
                zgt.Button(.{ .label = "Run",  .onclick = buttonClicked }),
            }),
            // Expanded means the widget will take all the space it can
            // in the parent container
            zgt.Expanded(
                // Editable Text Area
                zgt.TextArea(.{ .text = "Hello World!\n\nThis is a Zig GUI App...\n\nBuilt for PinePhone...\n\nWith zgt Library!" })
            )
        })  // End of Column
    );  // End of Window

    // Resize the Window (might not be correct for PinePhone)
    window.resize(800, 600);

    // Show the Window
    window.show();

    // Run the Event Loop to handle Touch Events
    zgt.runEventLoop();
}

/// This function is called when the Buttons are clicked
fn buttonClicked(button: *zgt.Button_Impl) !void {
    // Print the Button Label to console
    std.log.info(
        "You clicked button with text {s}",
        .{ button.getLabel() }
    );
}
```

Based on...

https://github.com/zenith391/zgt

# VSCode Remote

For convenience, we may use VSCode Remote to do Remote Development with PinePhone...

https://code.visualstudio.com/docs/remote/remote-overview

Just connect VSCode to PinePhone via SSH, as described here...

https://code.visualstudio.com/docs/remote/ssh

Remember to install the Zig Extension for VSCode...

https://github.com/ziglang/vscode-zig

![VSCode Remote on PinePhone](https://lupyuen.github.io/images/Screenshot%202022-06-22%20at%209.49.10%20AM~2.png)

# Pinebook Pro

_Will the Zig GUI App run on Arm64 laptops like Pinebook Pro?_

Yep! The same steps above will work on Pinebook Pro.

Here's our Zig GUI App running with Manjaro Xfce on Pinebook Pro...

![Our app running with Manjaro Xfce on Pinebook Pro](https://lupyuen.github.io/images/Screenshot_2022-06-22_18-13-31_061534.png)
