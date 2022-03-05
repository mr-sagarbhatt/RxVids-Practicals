import { iBook, iDamageLogger, iAuthor, iLibrarian } from "./interfaces";

class UniversityLibrarian implements iLibrarian {
  name!: string;
  email!: string;
  department!: string;

  assistCustomer(custName: string) {
    console.log(`${this.name} is assisting ${custName}`);
  }
}

abstract class ReferenceItem {
  // * Instance properties
  private _publisher!: string;
  // * Static property
  static department: string = `Research`;
  // * constructor
  constructor(public title: string, protected year: number) {
    console.log(`Creating a ReferenceItem...`);
  }
  // * Accessor Methods
  get publisher(): string {
    return this._publisher.toUpperCase();
  }
  set publisher(newPublisher: string) {
    this._publisher = newPublisher;
  }
  // * method
  printItem(): void {
    console.log(`${this.title} was published in ${this.year}.`);
    console.log(`Department: ${ReferenceItem.department}`);
  }

  abstract printCitation(): void;
}

class Encyclopedia extends ReferenceItem {
  constructor(newTitle: string, newYear: number, public editon: number) {
    super(newTitle, newYear);
  }
  printItem(): void {
    super.printItem();
    console.log(`Edition: ${this.editon} (${this.year})`);
  }
  printCitation(): void {
    console.log(`${this.title} - ${this.year}`);
  }
}

export { UniversityLibrarian, ReferenceItem, Encyclopedia };
