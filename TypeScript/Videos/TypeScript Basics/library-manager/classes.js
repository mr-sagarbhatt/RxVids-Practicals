"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Encyclopedia = exports.ReferenceItem = exports.UniversityLibrarian = void 0;
class UniversityLibrarian {
    assistCustomer(custName) {
        console.log(`${this.name} is assisting ${custName}`);
    }
}
exports.UniversityLibrarian = UniversityLibrarian;
class ReferenceItem {
    // * constructor
    constructor(title, year) {
        this.title = title;
        this.year = year;
        console.log(`Creating a ReferenceItem...`);
    }
    // * Accessor Methods
    get publisher() {
        return this._publisher.toUpperCase();
    }
    set publisher(newPublisher) {
        this._publisher = newPublisher;
    }
    // * method
    printItem() {
        console.log(`${this.title} was published in ${this.year}.`);
        console.log(`Department: ${ReferenceItem.department}`);
    }
}
exports.ReferenceItem = ReferenceItem;
// * Static property
ReferenceItem.department = `Research`;
class Encyclopedia extends ReferenceItem {
    constructor(newTitle, newYear, editon) {
        super(newTitle, newYear);
        this.editon = editon;
    }
    printItem() {
        super.printItem();
        console.log(`Edition: ${this.editon} (${this.year})`);
    }
    printCitation() {
        console.log(`${this.title} - ${this.year}`);
    }
}
exports.Encyclopedia = Encyclopedia;
