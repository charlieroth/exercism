const std = @import("std");

const alpha = "abcdefghijklmnopqrstuvwxyz";

pub const PangramError = error{NonAlpha};

pub fn toLower(c: u8) PangramError!u8 {
    return switch (c) {
        'a'...'z' => c,
        'A'...'Z' => c + 32,
        else => PangramError.NonAlpha,
    };
}

pub fn isPangram(str: []const u8) bool {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    var alphaMap = std.AutoHashMap(u8, u8).init(allocator);
    defer alphaMap.deinit();

    for (alpha) |c| {
        alphaMap.put(c, 0) catch {
            return false;
        };
    }

    for (str) |c| {
        const lowerC = toLower(c) catch {
            continue;
        };
        const v = alphaMap.getPtr(lowerC).?;
        v.* += 1;
    }

    var it = alphaMap.iterator();
    while (it.next()) |e| {
        if (e.value_ptr.* == 0) return false;
    }

    return true;
}
