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
