"use strict";
// * typeScript is a superset of JS, open source, cross platform, complies to JS
// * JS + additional features:
// *     strongly typed(static type),
// *     advanced language constructs (Functions, Interfaces, classes, Modules and namespaces, Generics),
// *     helps to write code with fewer errors
// * Declaring Variables: var, let, const -> es5: all variables complies to var -> es6: complies to var, let, const
let no = 10; // complied as: es5->var no, es6->let no
// * Basic Types: boolean, number, string, array, Enum, Any, void(function does not return a value)
// * Type Inference
let no1 = 12;
// no1 = "sagar" // gives error
// * Adding Type Annotations
let no3 = 12;
// * enums: specific set of values
// ? default value
var Category1;
(function (Category1) {
    Category1[Category1["Biography"] = 0] = "Biography";
    Category1[Category1["Poetry"] = 1] = "Poetry";
    Category1[Category1["Fiction"] = 2] = "Fiction";
})(Category1 || (Category1 = {})); // 0, 1, 2
// ? change order
var Category2;
(function (Category2) {
    Category2[Category2["Biography"] = 1] = "Biography";
    Category2[Category2["Poetry"] = 2] = "Poetry";
    Category2[Category2["Fiction"] = 3] = "Fiction";
})(Category2 || (Category2 = {})); // 1, 2, 3
// ? specific value
var Category3;
(function (Category3) {
    Category3[Category3["Biography"] = 5] = "Biography";
    Category3[Category3["Poetry"] = 7] = "Poetry";
    Category3[Category3["Fiction"] = 9] = "Fiction";
})(Category3 || (Category3 = {})); // 5, 7, 9
// ? variable of enum type
let favoriteCategory = Category3.Biography;
console.log(`favoriteCategory: ${Category3[favoriteCategory]} ${favoriteCategory}`);
// * Arrays
// ? Can be declared in two different ways
// * array literal
let str1 = ["here", "are", "strings"];
console.log(str1);
// * generic array
let str2 = ["here", "are", "strings"];
console.log(str2);
// ? array of any type
let str3 = ["here", 1, true, null];
console.log(str3);
// * tuples
// ? Array where types for first few elements are specified, Types do not have to be the same
let tuple1 = [1, "here"];
console.log(tuple1);
console.log(tuple1);
