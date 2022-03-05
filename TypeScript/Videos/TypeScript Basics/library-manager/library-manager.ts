import { Category } from "./enums";
import { iBook, iDamageLogger, iAuthor, iLibrarian } from "./interfaces";
import { UniversityLibrarian, ReferenceItem, Encyclopedia } from "./classes";

// * GET ALL BOOKS
function getAllBooks(): iBook[] {
  const books: {
    id: number;
    title: string;
    author: string;
    available: boolean;
    category: number;
  }[] = [
    {
      id: 1,
      title: "Ulysses",
      author: "James Joyce",
      available: true,
      category: Category.Fiction,
    },
    {
      id: 2,
      title: "A Farewell to Arms",
      author: "Ernest Hemingway",
      available: false,
      category: Category.Fiction,
    },
    {
      id: 3,
      title: "I Know Why Caged Bird Sings",
      author: "Maya Angelou",
      available: true,
      category: Category.Poetry,
    },
  ];
  return books;
}

// * FIRST AVAILABLE BOOK
function logFirstAvailable(
  books: {
    id: number;
    title: string;
    author: string;
    available: boolean;
    category: number;
  }[] = getAllBooks()
): void {
  const numberOfBooks: number = books.length;
  let firstAvailable: string = "";
  for (let currentBook of books) {
    if (currentBook.available) {
      firstAvailable = currentBook.title;
      break;
    }
  }
  console.log(`Total Books: ${numberOfBooks}`);
  console.log(`First Available: ${firstAvailable}`);
}

// * ADD BOOKS
function addBook(
  objAllBooks: {
    id: number;
    title: string;
    author: string;
    available: boolean;
    category: number;
  }[],
  objBook: {
    id: number;
    title: string;
    author: string;
    available: boolean;
    category: number;
  }
): void {
  objAllBooks.push(objBook);
}

function getBookTitlesByCategory(
  categoryFilter: Category = Category.Fiction
): Array<string> {
  console.log(
    `Getting books in category: ${Category[categoryFilter]}(${categoryFilter})`
  );
  const allBooks = getAllBooks();
  const filteredTitles: string[] = [];
  for (let currentBook of allBooks) {
    if (currentBook.category === categoryFilter) {
      filteredTitles.push(currentBook.title);
    }
  }
  return filteredTitles;
}

function logBookTitles(titles: string[]): void {
  for (const title of titles) {
    console.log(title);
  }
}

const allBooks = getAllBooks();

addBook(allBooks, {
  id: 4,
  title: "Moby Dick",
  author: "Herman Melville",
  available: true,
  category: Category.Fiction,
});

logFirstAvailable(allBooks);
const poetryBooks = getBookTitlesByCategory(Category.Poetry);
logBookTitles(poetryBooks);

// * Arrow Functions
poetryBooks.forEach((elem, ind, arr) => console.log(`${++ind} - ${elem}`));

const getBookById = (id: number): iBook => {
  const books = getAllBooks();
  return books.filter((book) => book.id === id)[0];
};

// * optional, default and rest parameters
function fnCreateCustomer(
  name: string = "sagar",
  age?: number,
  city?: string
): void {
  console.log(`Creating Customer: ${name}`);
  if (age) console.log(`Age: ${age}`);
  if (city) console.log(`City: ${city}`);
}
fnCreateCustomer("sagar", 23, "ahmedabad");

const fictionBooks = getBookTitlesByCategory();
fictionBooks.forEach((elem) => console.log(elem));

logFirstAvailable();

function checkoutBooks(customer: string, ...bookIds: number[]): string[] {
  console.log(`Checking out books for: ${customer}`);
  const booksCheckout: string[] = [];
  for (let id of bookIds) {
    let book = getBookById(id);
    if (book.available) {
      booksCheckout.push(book.title);
    }
  }
  return booksCheckout;
}
const myBooks: string[] = checkoutBooks("sagar", 1, 3);
myBooks.forEach((elem) => console.log(elem));

// * Function Overloading
function getTitles(author: string): string[];
function getTitles(available: boolean): string[];
function getTitles(bookProperty: any): string[] {
  const allBooks = getAllBooks();
  const foundTitles: string[] = [];
  if (typeof bookProperty === "string") {
    for (let book of allBooks) {
      if (book.author === bookProperty) foundTitles.push(book.title);
    }
  } else if (typeof bookProperty === "boolean") {
    for (let book of allBooks) {
      if (book.available === bookProperty) foundTitles.push(book.title);
    }
  }
  return foundTitles;
}

const strBooks = getTitles(false);
strBooks.forEach((elem) => console.log(elem));
const hermanBooks = getTitles(`Herman Melville`);
hermanBooks.forEach((elem) => console.log(elem));

function printBook(book: iBook): void {
  console.log(`${book.title} by ${book.author}`);
}
// const myBook = {
//   id: 5,
//   title: "Pride and Prejudice",
//   author: "Jane Austen",
//   available: true,
//   category: Category.Fiction,
//   year: "1813", // additional field
//   copies: 3, // additional field
// }; // Duck typing: doesn't give error if have additional fields but must have defined fields

const myBook: iBook = {
  id: 5,
  title: "Pride and Prejudice",
  author: "Jane Austen",
  available: true,
  category: Category.Fiction,
  pages: 250,
  markDamaged: (reason: string) => console.log(`Damaged: ${reason}`),
};

// printBook(myBook);
// myBook.markDamaged(`Missing back cover!`);

let logDamage: iDamageLogger;
logDamage = (damage: string) => console.log(`Damage reported: ${damage}`);
logDamage(`coffee stains`);

// const favoriteAuthor: iAuthor = {};
// const favoriteLibrarian: iLibrarian = {};

const favoriteLibrarian = new UniversityLibrarian();
favoriteLibrarian.name = "sagar";
favoriteLibrarian.assistCustomer("sharon");

// * classes
// const ref: ReferenceItem = new ReferenceItem(`Facts and Figures`, 2016);
// ref.printItem();
// ref.publisher = `Random data publishing`; // setter
// console.log(ref.publisher); // getter

const refBook: ReferenceItem = new Encyclopedia("WorldPedia", 1900, 10);
refBook.printItem();
refBook.printCitation();

// * class expressions
