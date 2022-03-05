namespace Utility {
  export namespace Fees {
    export function calculateLateFees(daysLate: number): number {
      return daysLate * 0.25;
    }
  }
  export function maxBooksAllowed(age: number): number {
    if (age < 12) {
      return 3;
    } else {
      return 10;
    }
  }

  // * private utility function: which is not accessible by others
  function privateFunc(): void {
    console.log("This is private...");
  }
}
