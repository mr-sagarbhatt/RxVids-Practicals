var Utility;
(function (Utility) {
    let Fees;
    (function (Fees) {
        function calculateLateFees(daysLate) {
            return daysLate * 0.25;
        }
        Fees.calculateLateFees = calculateLateFees;
    })(Fees = Utility.Fees || (Utility.Fees = {}));
    function maxBooksAllowed(age) {
        if (age < 12) {
            return 3;
        }
        else {
            return 10;
        }
    }
    Utility.maxBooksAllowed = maxBooksAllowed;
    // * private utility function: which is not accessible by others
    function privateFunc() {
        console.log("This is private...");
    }
})(Utility || (Utility = {}));
/// <reference path="utilityFunctions.ts" />
var util = Utility.Fees; // * alias for namespace: using import statement
const fees = util.calculateLateFees(10);
console.log(`Fees: ${fees}`);
