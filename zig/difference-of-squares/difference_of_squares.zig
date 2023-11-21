const std = @import("std");
const debug = std.debug;

pub fn squareOfSum(number: usize) usize {
    var sum: usize = 0;
    for (0..(number + 1)) |n| {
        sum += n;
    }

    return sum * sum;
}

pub fn sumOfSquares(number: usize) usize {
    var sum: usize = 0;
    for (0..(number + 1)) |n| {
        sum += n * n;
    }
    return sum;
}

pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}
