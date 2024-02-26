using { com.varsha.storedb as db} from '../db/schema';


service StoreDB {
    entity BusinessPartner as projection on db.BusinessPartner;
    entity Store as projection on db.Store;
    entity Product as projection on db.Product;
    entity StockData as projection on db.StockData;
    entity Purchase as projection on db.Purchase;
    entity State as projection on db.State;
    entity Sales as projection on db.Sales;
    
}

annotate StoreDB.BusinessPartner with @odata.draft.enabled;
annotate StoreDB.Store with @odata.draft.enabled;
annotate StoreDB.Product with @odata.draft.enabled;
annotate StoreDB.StockData with @odata.draft.enabled;
annotate StoreDB.Purchase with @odata.draft.enabled;
annotate StoreDB.Sales with @odata.draft.enabled;

annotate StoreDB.BusinessPartner with {
    first_name      @assert.format: '^[a-zA-Z]{2,}$';
    last_name      @assert.format: '^[a-zA-Z]{2,}$';    
    pin_code    @assert.format: '^[1-9][0-9]{5}$';
    gstin_number    @assert.format : '^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$';
}


annotate StoreDB.Store with {
    pin_code    @assert.format: '^[1-9][0-9]{5}$';
}

annotate StoreDB.Product with {
   product_img_url  @assert.format : '(http(s?):)([/|.|\w|\s|-])*\.(?:jpg|gif|png)'
}

annotate StoreDB.State with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : code
        },
        {
            $Type : 'UI.DataField',
            Value : description
        }
    ]
);

annotate StoreDB.Store with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : store_id
        },
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : address_1
        },
        {
            $Type : 'UI.DataField',
            Value : address_2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : pin_code
        },
        
    ],
    UI.SelectionFields: [ store_id,name],       
);

annotate StoreDB.Store with @(
    UI.FieldGroup #StoreInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
           {
            $Type : 'UI.DataField',
            Value : store_id
        },
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : address_1
        },
        {
            $Type : 'UI.DataField',
            Value : address_2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : pin_code
        },
        ],
    },
   UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StoreInfoFacet',
            Label : 'Store Information',
            Target : '@UI.FieldGroup#StoreInformation',
        },
    ],    
);

annotate StoreDB.BusinessPartner with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : business_partner_number
        },
        {
            $Type : 'UI.DataField',
            Value : first_name
        },
        {
            $Type : 'UI.DataField',
            Value : last_name
        },
        {
            $Type : 'UI.DataField',
            Value : address_1
        },
        {
            $Type : 'UI.DataField',
            Value : address_2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : pin_code
        },
        {
             $Type : 'UI.DataField',
            Value : Is_gstn_registered
        },
        {
             $Type : 'UI.DataField',
            Value : gstin_number
        },
        {
             $Type : 'UI.DataField',
            Value : is_vendor
        },
        {
             $Type : 'UI.DataField',
            Value : is_customer
        }
    ],
    UI.SelectionFields: [ business_partner_number,first_name , last_name],       
);

annotate StoreDB.BusinessPartner with @(
    UI.FieldGroup #BusinessPartnerInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            Value : business_partner_number
        },
        {
            $Type : 'UI.DataField',
            Value : first_name
        },
        {
            $Type : 'UI.DataField',
            Value : last_name
        },
        {
            $Type : 'UI.DataField',
            Value : address_1
        },
        {
            $Type : 'UI.DataField',
            Value : address_2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : pin_code
        },
        {
             $Type : 'UI.DataField',
            Value : Is_gstn_registered
        },
        {
             $Type : 'UI.DataField',
            Value : gstin_number
        },
        ],
    },
   UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'BusinessPartnerInfoFacet',
            Label : 'Business Partner Information',
            Target : '@UI.FieldGroup#BusinessPartnerInformation',
        },
    ],    
);

annotate StoreDB.Product with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : product_id
        },
        {
            $Type : 'UI.DataField',
            Value : product_name
        },
        {
            $Type : 'UI.DataField',
            Value : product_img_url
        },
        {
            $Type : 'UI.DataField',
            Value : product_cost_price
        },
        {
            $Type : 'UI.DataField',
            Value : product_sell_price
        },
    ],
    UI.SelectionFields: [ product_id,product_name],       
);

annotate StoreDB.Product with @(
    UI.FieldGroup #ProductInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
             {
            $Type : 'UI.DataField',
            Value : product_id
        },
        {
            $Type : 'UI.DataField',
            Value : product_name
        },
        {
            $Type : 'UI.DataField',
            Value : product_img_url
        },
        {
            $Type : 'UI.DataField',
            Value : product_cost_price
        },
        {
            $Type : 'UI.DataField',
            Value : product_sell_price
        },
        ],
    },
   UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ProductInfoFacet',
            Label : 'Product Information',
            Target : '@UI.FieldGroup#ProductInformation',
        },
    ],    
);

annotate StoreDB.StockData with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : store_id_ID
        },
        {
            $Type : 'UI.DataField',
            Value : product_id_ID
        },
        {
            $Type : 'UI.DataField',
            Value : stock_qty
        },
    ],
    UI.SelectionFields: [ store_id_ID,product_id_ID],       
);

annotate StoreDB.StockData with @(
    UI.FieldGroup #StockDataInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
             {
            $Type : 'UI.DataField',
            Value : store_id_ID
        },
        {
            $Type : 'UI.DataField',
            Value : product_id_ID
        },
        {
            $Type : 'UI.DataField',
            Value : stock_qty
        },
        ],
    },
   UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StockInfoFacet',
            Label : 'Stock Data Information',
            Target : '@UI.FieldGroup#StockDataInformation',
        },
    ],    
);


annotate StoreDB.Purchase with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : pod
        },
        {
            $Type : 'UI.DataField',
            Value : business_partner_number_ID
        },
        {
            $Type : 'UI.DataField',
            Value : purchase_order__date
        },
    ],
    UI.SelectionFields: [ ],       
);

annotate StoreDB.Purchase with @(
    UI.FieldGroup #PurchaseInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
             {
            $Type : 'UI.DataField',
            Value : pod
        },
        {
            $Type : 'UI.DataField',
            Value : business_partner_number_ID
        },
        {
            $Type : 'UI.DataField',
            Value : purchase_order__date
        },
        ],
    },
   UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PurchaseInfoFacet',
            Label : 'Purchase Information',
            Target : '@UI.FieldGroup#PurchaseInformation',
        },
    ],    
);


annotate StoreDB.Sales with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : sod
        },
        {
            $Type : 'UI.DataField',
            Value : business_partner_number_ID
        },
        {
            $Type : 'UI.DataField',
            Value : sales_date
        },
    ],
    UI.SelectionFields: [ ],       
);

annotate StoreDB.Sales with @(
    UI.FieldGroup #SalesInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
             {
            $Type : 'UI.DataField',
            Value : sod
        },
        {
            $Type : 'UI.DataField',
            Value : business_partner_number_ID
        },
        {
            $Type : 'UI.DataField',
            Value : sales_date
        },
        ],
    },
   UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'SalesInfoFacet',
            Label : 'Sales Information',
            Target : '@UI.FieldGroup#SalesInformation',
        },
    ],    
);


annotate StoreDB.BusinessPartner with {
    state @(     
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Genders',
            CollectionPath : 'State',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : state,
                    ValueListProperty : 'code'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                }
            ]
        }
    );


}