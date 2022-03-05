// * Namespace
// created using namespace keyword
var Membership;
(function (Membership) {
    function addMember(name) {
        console.log(name);
    }
    Membership.addMember = addMember;
    // * Nested Namespace
    let Cards;
    (function (Cards) {
        function issueCard(menberNumber) {
            console.log(menberNumber);
        }
        Cards.issueCard = issueCard;
    })(Cards = Membership.Cards || (Membership.Cards = {}));
})(Membership || (Membership = {}));
// * Modules vs Namespaces: Tool for organizing code
// ? Internal modules: "Namespaces"
// ? External modules: "Modules"
// // * Namespace
// // created using namespace keyword
// namespace Membership {
//   export function addMember(name: string) {
//     console.log(name);
//   }
//   // * Nested Namespace
//   export namespace Cards {
//     export function issueCard(menberNumber: number) {
//       console.log(menberNumber);
//     }
//   }
// }
/// <reference path="./namespaces.ts" />
Membership.addMember("sagar"); // namespace.functionName
Membership.Cards.issueCard(1234); // outerNamespace.innerNamespace.functionName
// * Triple-Slash References
//  <reference path="filename.ts" />; // External Namespace
// ? TypeScript compiler will automatically compiles the all required references
// ? Use --outFile compiler option to generate a single JS output file
