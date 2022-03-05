//  * Interfaces
// ? We can define our own type
// Duck Typing
// Interfaces for function types
// Extending Interfaces
// Interfaces for class types

// ? Interface
// A contract that define types
// Complier enforces the contract via type checking
// to specify shape of an object -- Duck Typing
// collection of property and method definition(not implementation details), only declaration

// * Duck typing
interface iDuck {
  walk: () => void;
  swim: () => void;
  quack: () => void;
}
let probablyDuck = {
  walk: () => console.log(`walking like a duck`),
  swim: () => console.log(`swimming like a duck`),
  quack: () => console.log(`quacking like a duck`),
};

function flyOverWater(bird: iDuck) {
  return [bird.walk(), bird.swim(), bird.quack()];
}
flyOverWater(probablyDuck);

// * Interface
interface iBook {
  id: number;
  title: string;
  author: string;
  pages?: number; // * OPTIONAL PARAMETER
  markDamaged: (reason: string) => void;
}

// * Interfaces for function types
interface iStringGenerator {
  (chars: string, nums: number): string;
}

export { iStringGenerator };

// * Extending Interface
interface iLibraryResource {
  catalogNumber: number;
}
interface iBook {
  title: string;
}
interface iEncyclopedia extends iLibraryResource, iBook {
  volume: number;
} // when we use this interface we must use properties from all interfaces

// * Class Types
// * define a shape of an object
interface iLibrarian {
  doWork: () => void;
}
class ElementarySchoolLibrarian implements iLibrarian {
  doWork() {
    console.log(`Reading to and teaching children...`);
  }
}
// must use the interface
const obj: iLibrarian = new ElementarySchoolLibrarian();
obj.doWork();

// Interfaces vs classes:
// Both provides properties and methods: Interface declares properties and methods where Classes provide implementation details(definition) for those
