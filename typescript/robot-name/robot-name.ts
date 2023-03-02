function allPossibleNames() {
  const names: string[] = [];
  for (let i = 0; i < 25; i++) {
    for (let j = 0; j < 25; j++) {
      for (let k = 0; k < 10; k++) {
        for (let l = 0; l < 10; l++) {
          for (let m = 0; m < 10; m++) {
            const _i = String.fromCharCode(97 + i).toUpperCase();
            const _j = String.fromCharCode(97 + j).toUpperCase();
            names.push(`${_i}${_j}${k}${l}${m}`);
          }
        }
      }
    }
  }

  return names;
}

const possibleNames = allPossibleNames();

export class Robot {
  private _name: string;
  private previousNameIndicies: Set<number>;
  private numberOfNames = 25 * 25 * 10 * 10 * 10;

  constructor() {
    const nameIndex = Math.floor(Math.random() * this.numberOfNames);

    this.previousNameIndicies = new Set<number>();
    this.previousNameIndicies.add(nameIndex);

    this._name = possibleNames[nameIndex];
  }

  public get name(): string {
    return this._name;
  }

  public resetName(): void {
    let curr = Math.floor(Math.random() * this.numberOfNames);
    let cont = true;
    while (cont) {
      if (!this.previousNameIndicies.has(curr)) {
        this.previousNameIndicies = new Set<number>();
        this.previousNameIndicies.add(curr);
        this._name = possibleNames[curr];
        cont = false;
      }
    }
  }

  public static releaseNames(): void {
    this.possibleNames = [];
  }
}
