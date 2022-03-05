/// <reference path="utilityFunctions.ts" />

import util = Utility.Fees; // * alias for namespace: using import statement
const fees = util.calculateLateFees(10);
console.log(`Fees: ${fees}`);
