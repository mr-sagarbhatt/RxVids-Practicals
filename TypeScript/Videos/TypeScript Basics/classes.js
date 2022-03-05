// * Classes: Template for creating objects
// Class members:
//      -Constructors
//      -Properties
//      -Methods
// Access Modifier
// Inheritance (extend classes)
// Abstract classes
// Class expressions
// Template for creating objects, all objects have same properties and methods
// Provide state storage(properties) and behavior(methods)
// Encapsulate reusable functionality
// * Constructors
// method named constructor - only 1 per class
// use optional parameters to call different ways
// Executed by using the new keyword
// * Properties and methods(function inside a class)
// 2 ways to define properties
//      1. Define a variable ex: numberOfPages: number;
//      2. Custom Accessors(getter, setter)
//          getter
//            get editor(): string {}
//          setter
//            set editor(newEditor: string) {}
class ReferenceItem {
    // constructor
    constructor(numberOfPages, title, publisher) {
        this.numberOfPages = numberOfPages;
        if (publisher) {
            console.log(numberOfPages, title, publisher);
        }
        else {
            console.log(numberOfPages, title);
        }
    }
    //   2 way
    // getter
    get editor() {
        return this.myEditor;
    }
    // setter
    set editor(newEditor) {
        this.myEditor = newEditor;
    }
    // method
    printChapterTitle(chapterTitle) {
        console.log(`${chapterTitle}`);
    }
}
const objItem = new ReferenceItem(99, "worldPedia", "WorldPub");
objItem.editor = "XYZ";
console.log(objItem.editor);
objItem.printChapterTitle(`Chapter 1`);
// * Static properties: Properties of class not instances
class Author1 {
    // * assigning value to property using constructor
    constructor(name) {
        this.authorName = name;
    }
}
// Static Property
Author1.description = `A source of knowledge`; // Static Property
const author1 = new Author1("sagar");
console.log(author1.authorName);
// console.log(author1.description); // Static Property: not available on instances
console.log(Author1.description); // Static Property: available on class
// * Parameter properties
class Author2 {
    // Parameter properties: not required to declare property explicitly
    constructor(name) {
        this.name = name;
    } // public is required, we can access using obj.name
}
const author2 = new Author2("sagar");
console.log(author2.name);
// * Access Modifier: public(default), private, protected
// * Inheritance: share its members with one or more sub classes
// * super(): refers to the parents class
class Journal extends ReferenceItem {
    constructor() {
        super(99, "worldPedia", "WorldPub");
        console.log(`Journal Constructor`);
    }
}
const journal = new Journal();
// * Abstract Classes
// Created with abstract keyword, not be instantiated(can't create an object)
// abstract method: abstract methods are not implemented
// instance methods: May contain implementation details
// * Class Expressions
const Newspaper = class extends ReferenceItem {
    printCitation() {
        console.log(`Newspaper: ${this.numberOfPages}`);
    }
};
const myPaper = new Newspaper(99, `The Gazette`, `XYZ`);
myPaper.printCitation();
class Novel extends class {
    constructor() {
        this.title = `xyz`;
    }
} {
    constructor() {
        super(...arguments);
        this.mainChapter = `abc`;
    }
}
const favoriteNovel = new Novel();
console.log(favoriteNovel.title);
console.log(favoriteNovel.mainChapter);
