import { Category } from "./enums";

interface iBook {
  id: number;
  title: string;
  author: string;
  available: boolean;
  category: Category;
  pages?: number;
  markDamaged?: iDamageLogger;
}

// * Interfaces for function types
interface iDamageLogger {
  (reason: string): void;
}

// * Extending Interface
interface iPerson {
  name: string;
  email: string;
}

interface iAuthor extends iPerson {
  numBookPublished: number;
}

interface iLibrarian extends iPerson {
  department: string;
  assistCustomer: (custName: string) => void;
}

export { iBook, iDamageLogger, iAuthor, iLibrarian };
