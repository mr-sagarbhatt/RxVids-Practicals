// * TS Functions:
// Features:
// ? specify parameter types and return type
// ? parameters: optional parameters, default parameters, rest parameters
// ? overloaded functions: functions with same name

function createCustomerId(name: string, id: number): string {
  return name + id;
}
const id = createCustomerId("sagar", 1);
console.log(id);

// * Arrow functions: lambda/ anonymous functions
// this is captured at function creation - not invocation
const books = ["Ulysses", "A Farewell to Arms", "I Know Why Caged Bird Sings"];
books.forEach(() => console.log("Done Reading!"));
books.forEach((title) => console.log(title));
books.forEach((title, index, array) => console.log(title, index, array));

// * Capturing this in JS
// represent two execution context
function fnBook() {
  console.log(`this:`, this);
  let self = this;
  console.log(`self:`, self);
  self.publishDate = 2016;
  this.date = 2017;
  setTimeout(function () {
    console.log(this, self.publishDate, this.date);
  }, 1000);
}
fnBook();

function fnArrowBook() {
  console.log(`this:`, this);
  this.publishDate = 2016;
  this.date = 2017;
  setTimeout(() => console.log(this, this.publishDate, this.date), 1000);
}
fnArrowBook();

// * Function types
function publicationMessage(year: number): string {
  return `Date Published: ${year}`;
}
// variable declare with function type
// Type Definition for a function
let publishFunc: (someYear: number) => string;
// function assigned must have the same signature as the variable type
publishFunc = publicationMessage;

const message: string = publishFunc(2016);
console.log(message);

// * Declaring and using function type
function fnCreateCustomerId(name: string, id: number): string {
  return name + id;
}
let x: number;
x = 5;
import { iStringGenerator } from "./interfaces";
let idGenerator: iStringGenerator;
// idGenerator = fnCreateCustomerId;
idGenerator = (name: string, id: number) => id + name;
let myId: string = idGenerator("sagar", 10);
console.log(myId);

// * Optional (?) and Default parameter
// In TS all parameters are required, optional parameters denoted with "?" after parameter name and must appear after all required parameters
// Default parameters may be set to a literal value or an expression

function createCustomer(name: string, age?: number) {}
function fnGetBookById(title: string = "The C Programming Language") {}
function fncGetBookById(title = fnGetBookById()) {}

// * Rest Parameters (...)
// Collects a group of parameters into a single array
// bookIds: rest operator
function getBooksReadForCust(name: string, ...bookIds: number[]) {
  console.log(name, bookIds, ...bookIds); // bookIds: spread operator
}
getBooksReadForCust("sagar", 1, 2, 3, 4, 5);

// * Function overload
function fncGetTitles(author: string): string[];
function fncGetTitles(available: boolean): string[];
function fncGetTitles(bookProperty: any): string[] {
  let titles: string[] = [];
  if (typeof bookProperty === "string") {
    titles = ["string"];
  }
  if (typeof bookProperty === "boolean") {
    titles = ["boolean"];
  }
  return titles;
}
console.log(fncGetTitles(true));
