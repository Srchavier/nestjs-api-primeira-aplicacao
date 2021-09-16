export enum TransationCategory {
  CATEGORY1 = 'Category1',
  CATEGORY2 = 'Category2',
}

export enum TransationType {
  CREDIT = 'credit',
  DEBIT = 'debit',
}

export class CreateTransactionDto {
  payment_date: Date;
  name: string;
  description: string;
  category: TransationCategory;
  amount: number;
  type: TransationType;
}
