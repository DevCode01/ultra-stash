const std = @import("std");

pub fn main(init: std.process.Init) !void {
    const io = init.io;
    const arena = init.arena.allocator();
    const args = try init.minimal.args.toSlice(arena);

    var n: u32 = 10;
    if (args.len > 1) {
        n = std.fmt.parseInt(u32, args[1], 10) catch 10;
    }

    var buf: [0x100]u8 = undefined;
    var w = std.Io.File.stdout().writer(io, &buf);
    const stdout = &w.interface;

    var a: u64 = 0;
    var b: u64 = 1;
    var i: u32 = 0;
    while (i < n) : (i += 1) {
        if (i > 0) try stdout.print(", ", .{});
        try stdout.print("{d}", .{a});
        const next = a + b;
        a = b;
        b = next;
    }
    try stdout.print("\n", .{});
    try stdout.flush();
}
