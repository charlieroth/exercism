enum Strands {
  G = "G",
  C = "C",
  T = "T",
  A = "A",
  U = "U",
}

type Strand = `${Strands}`;

function transcribe(strand: string): Strand {
  switch (strand) {
    case Strands.G:
      return Strands.C;
    case Strands.C:
      return Strands.G;
    case Strands.T:
      return Strands.A;
    case Strands.A:
      return Strands.U;
    default:
      throw new Error("Invalid input DNA.");
  }
}

export function toRna(strands: string) {
  return strands.split("").map(transcribe).join("");
}
