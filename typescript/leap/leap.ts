function divisibleBy(num: number, divisor: number): boolean {
  return num % divisor === 0;
}

export function isLeap(year: number): boolean {
  if (divisibleBy(year, 4)) {
    if (divisibleBy(year, 100) && !divisibleBy(year, 400)) {
      return false;
    }

    if (!divisibleBy(year, 100) && divisibleBy(year, 400)) {
      return true;
    }

    return true;
  }

  return false;
}
