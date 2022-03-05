/// <reference path="utilityFunctions.ts" />
var util = Utility.Fees; // * alias for namespace: using import statement
const fees = util.calculateLateFees(10);
console.log(`Fees: ${fees}`);
