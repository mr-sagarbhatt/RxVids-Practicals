// * typeScript is a superset of JS, open source, cross platform, complies to JS
// * JS + additional features:
// *     strongly typed(static type),
// *     advanced language constructs (Functions, Interfaces, classes, Modules and namespaces, Generics),
// *     helps to write code with fewer errors

// * Declaring Variables: var, let, const -> es5: all variables complies to var -> es6: complies to var, let, const
let no: number = 10; // complied as: es5->var no, es6->let no

// * Basic Types: boolean, number, string, array, Enum, Any, void(function does not return a value)

// * Type Inference
let no1 = 12;
// no1 = "sagar" // gives error

// * Adding Type Annotations
let no3: number = 12;

// * enums: specific set of values
// An enum is a way of giving more friendly names to sets of numeric values.
// Enums allow a developer to define a set of named constants. Using enums can make it easier to document intent, or create a set of distinct cases. TypeScript provides both numeric and string-based enums.
// ? default value
enum Category1 {
  Biography,
  Poetry,
  Fiction,
} // 0, 1, 2

// ? change order
enum Category2 {
  Biography = 1,
  Poetry,
  Fiction,
} // 1, 2, 3

// ? specific value
enum Category3 {
  Biography = 5,
  Poetry = 7,
  Fiction = 9,
} // 5, 7, 9

// ? variable of enum type
let favoriteCategory: Category3 = Category3.Biography;
console.log(
  `favoriteCategory: ${Category3[favoriteCategory]} ${favoriteCategory}`
);

// * Arrays
// ? Can be declared in two different ways
// * array literal
let str1: string[] = ["here", "are", "strings"];
console.log(str1);

// * generic array
let str2: Array<string> = ["here", "are", "strings"];
console.log(str2);

// ? array of any type
let str3: Array<any> = ["here", 1, true, null];
console.log(str3);

// * tuples
// an array with a fixed number of elements whose types are known
let tuple1: [number, string] = [1, "here"];
console.log(tuple1);
console.log(tuple1);
