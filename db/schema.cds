using { managed } from '@sap/cds/common';

namespace sales;

entity SalesOrderHeaders: managed {
    key ID : UUID;
    totalAmount : Decimal(15,2);
    customerID : Association to one Customers;
    items: Composition of many SalesOrderItems on items.headerID = $self;
}

entity SalesOrderItems {
    key ID : UUID;
    headerID : Association to SalesOrderHeaders;
    productID : Association to Products;
    quantity : Integer;
    price : Decimal(15,2);
}

entity Customers: managed {
    key ID : UUID;
    firstName : String(50);
    lastName : String(50);
    email : String(100);
}

entity Products: managed {
    key ID : UUID;
    name : String(100);
    price : Decimal(15,2);
}
