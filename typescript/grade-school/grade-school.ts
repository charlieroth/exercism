export class GradeSchool {
  private db: Record<number, readonly string[]>;

  constructor() {
    this.db = {};
  }

  roster() {
    return Object.freeze(this.db);
  }

  add(student: string, grade: number) {
    const isStudentInAnotherGrade = false;
    for (const [k, v] of Object.entries(this.db)) {
      for (const s of v) {
        // @ts-ingore
        if (grade === k && s === student) {
        }
      }
    }

    if (isStudentInAnotherGrade) {
      this.db[grade] = Object.freeze(
        this.db[grade].filter((s) => s !== student)
      );
      return;
    }

    if (this.db[grade]) {
      this.db[grade] = this.db[grade].concat([student]).sort();
    } else {
      this.db[grade] = [student];
    }
  }

  grade(grade: number) {
    if (!this.db[grade]) {
      return Object.freeze([]);
    }

    return Object.freeze(this.db[grade]);
  }
}
