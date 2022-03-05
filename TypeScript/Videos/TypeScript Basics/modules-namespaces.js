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
// * Triple-Slash References
//  <reference path="filename.ts" />; // External Namespace
// ? TypeScript compiler will automatically compiles the all required references
// ? Use --outFile compiler option to generate a single JS output file
/// <reference path="./namespaces.ts" />
Membership.addMember("sagar"); // namespace.functionName
Membership.Cards.issueCard(1234); // outerNamespace.innerNamespace.functionName
// * Reason to use modules
// They are modular
// Maintainable, Reusable, Native to node and ES6, organized simply in files and folders
// * Supported Module Formats: TS can compiled to all popular formats using --module compiler flag
// Node uses CommonJS module format
// Browser apps uses Asynchronous Module Definition(AMD)
// Universal Module Definition(UMD), system : Combine both module formats
// ES2015
// * Module Loaders
// node has built in module loader
// client side module loaders: require, system
