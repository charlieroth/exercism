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

function getUnit(value: number) {
  switch (value) {
    case 1:
    case 10:
      return "ohms";
    case 100:
      return "kiloohms";
    case 1000:
      return "megaohms";
    case 10000:
      return "gigaohms";
    default:
      throw new Error("Unhandled unit");
  }
}

export function decodedResistorValue(colors: string[]): string {
  let value = 0;
  let multiplier = 1;
  let i = 0;
  for (; i < 2; i++) {
    const color = colors[i];
    const resistorValue = getResistorValue(color as ResistorColor);
    value = value * multiplier + resistorValue;
    multiplier *= 10;
  }

  const ohmModifier = colors[i];
  const omhModifierValue = getResistorValue(ohmModifier as ResistorColor);
  const exponentialValue = Math.pow(10, omhModifierValue);
  const unit = getUnit(exponentialValue);

  if (exponentialValue > 10) {
    value /= exponentialValue / 10;
  } else {
    value *= exponentialValue;
  }

  return `${value} ${unit}`;
}
