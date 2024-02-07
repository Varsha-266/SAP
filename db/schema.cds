namespace com.varsha.storedb;
using { managed, cuid } from '@sap/cds/common';

/*@assert.unique:{
    studentid:[studentid]
}*/
entity BuisinessPartner: cuid, managed {
    @title: 'Business Partner Number'
    bp_number: String(5);
    @title: ' Name'
    name: String(40) ;
    @title: 'Address 1'
    address_1: String(40);
    @title: 'Adress 2'
   address_2: String(100) ;
    @title: 'City'
    city: String(20) ;
    @title: 'State'
    state: Association to States;
    @title: 'PIN Code'
    pincode: String(10);
    @title:'Is_GSTN_Registered'
    is_gstn_registered: Boolean default false;
    @title:'GSTIN Number'
    is_gstin_number: String(15) @mandatory;
    @title:'IS Vendor'
    is_vendor: Boolean default false;
    @title:'IS Customer'
    is_customer: Boolean default false;
   }
   
entity Store {
    key ID: UUID;
    store_id :String(10);
    name         : String(100);
    add1     : String(255);
    add2     : String(255);
    city         : String(100);
    state        : Association to States;
    PinCode      : String(10) @(assert.format: '^[1-9][0-9]{5}$');
}

entity Product {
    key ID: UUID;
    p_id           : String(20); 
    name     : String(100);
    imageURL        : String(255);
    costPrice       : Decimal(15, 2); 
    sellPrice       : Decimal(15, 2); 
}


entity Stock {
    key ID            : UUID;
    store_id         : Association to Store;
    product_id       : Association to Product;
    stock_qty        : Integer;
}


@cds.persistence.skip
entity States {
    @title:'code'
    key code: String(3);
    @title:'description'
    description:String(10);
    
}
