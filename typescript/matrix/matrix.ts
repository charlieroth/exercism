export class Matrix {
  private _rows: number[][];

  constructor(input: string) {
    const rows: number[][] = [];
    for (const line of input.split("\n")) {
      const row = line.split(" ").map((n) => parseInt(n));
      rows.push(row);
    }
    this._rows = rows;
  }

  get rows(): number[][] {
    return this._rows;
  }

  get columns(): number[][] {
    const columns: number[][] = [];

    for (let i = 0; i < this._rows.length; i++) {
      const column: number[] = [];
      for (let j = 0; j < this._rows.length; j++) {
        column.push(this._rows[j][i]);
      }
      columns.push(column);
    }

    return columns;
  }
}
