type ResistorColor =
  | "black"
  | "brown"
  | "red"
  | "orange"
  | "yellow"
  | "green"
  | "blue"
  | "violet"
  | "grey"
  | "white";

function getResistorValue(color: ResistorColor): number {
  const values: Record<ResistorColor, number> = {
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9,
  };

  const value = values[color];
  if (value === undefined) {
    return 0;
  }

  return value;
}

export function decodedValue(colors: string[]): number {
  let value = 0;
  let multiplier = 1;
  for (let i = 0; i < 2; i++) {
    const color = colors[i];
    const resistorValue = getResistorValue(color as ResistorColor);
    value = value * multiplier + resistorValue;
    multiplier *= 10;
  }

  return value;
}
