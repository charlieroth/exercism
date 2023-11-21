fn scrabble_value(c: u8) u8 {
    return switch (c) {
        'A', 'a', 'E', 'e', 'I', 'i', 'O', 'o', 'U', 'u', 'L', 'l', 'N', 'n', 'R', 'r', 'S', 's', 'T', 't' => 1,
        'D', 'd', 'G', 'g' => 2,
        'B', 'b', 'C', 'c', 'M', 'm', 'P', 'p' => 3,
        'F', 'f', 'H', 'h', 'V', 'v', 'W', 'w', 'Y', 'y' => 4,
        'K', 'k' => 5,
        'J', 'j', 'X', 'x' => 8,
        'Q', 'q', 'Z', 'z' => 10,
        else => 0,
    };
}

pub fn score(s: []const u8) u32 {
    var scrabble_score: u32 = 0;
    for (s) |c| {
        const value = scrabble_value(c);
        scrabble_score += value;
    }

    return scrabble_score;
}
