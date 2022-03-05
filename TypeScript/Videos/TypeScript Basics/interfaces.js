"use strict";
//  * Interfaces
// ? We can define our own type
// Duck Typing
// Interfaces for function types
// Extending Interfaces
// Interfaces for class types
Object.defineProperty(exports, "__esModule", { value: true });
let probablyDuck = {
    walk: () => console.log(`walking like a duck`),
    swim: () => console.log(`swimming like a duck`),
    quack: () => console.log(`quacking like a duck`),
};
function flyOverWater(bird) {
    return [bird.walk(), bird.swim(), bird.quack()];
}
flyOverWater(probablyDuck);
class ElementarySchoolLibrarian {
    doWork() {
        console.log(`Reading to and teaching children...`);
    }
}
// must use the interface
const obj = new ElementarySchoolLibrarian();
obj.doWork();
