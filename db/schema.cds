namespace com.varsha.storedb;
using { managed, cuid } from '@sap/cds/common';

@assert.unique:{
    bpidid:[bpid]
}
entity BusinessPatner: cuid, managed {
    @title: 'Business patner id'
    bpid: String(5);
    @title: 'Name'
    name: String(30);
    @title: 'Address1'
    add1: String(100) @mandatory;
    @title: 'Address2'
    add2: String(100) @mandatory;
    @title: 'City'
    city: String(40);
    @title: 'Pincode'
    pinc: String(5);
    @title: 'Is_gstn_registerd'
    isgstn: Boolean;
    @title: 'GSTIN Number'
    gstin: String(15);
    @title: 'State'
state: Association to States;
    
}

@cds.persistence.skip

entity States: cuid, managed {
    @title: 'Code'
    code: String(3);
    @title: 'Description'
    description: String(50);
   
}