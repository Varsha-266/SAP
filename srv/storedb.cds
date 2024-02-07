using {com.varsha.storedb as db} from '../db/schema';

service StoreDB {

    entity BusinessPartner as projection on db.BusinessPartner;
    entity stores as projection on db.Store;
   }
   
annotate StoreDB.BusinessPartner with @odata.draft.enabled;


annotate StoreDB.BusinessPartner with {
    add1    @assert.format: '^[a-zA-Z]{2,}$';
    add2    @assert.format: '^[a-zA-Z]{2,}$';    
      //telephone @assert.format: '^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$';
};

annotate StoreDB.BusinessPartner with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : bpid
        },
        
        {
            $Type : 'UI.DataField',
            Label: 'State',
            Value : State
        },
        
        {
            $Type : 'UI.DataField',
            Value : add1
        },
        {
            $Type : 'UI.DataField',
            Value : add2
        },
        

    ],
    UI.SelectionFields: [ add1 , add2, ],    
    UI.FieldGroup #BusinessPatnerInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : bpid,
            },
           
            {
                $Type : 'UI.DataField',
                Value : add1,
            },
            {
                $Type : 'UI.DataField',
                Value : add2,
            },
            
            {
                $Type: 'UI.DataField',
                Value: course_ID,
            },
           
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'InfoFacet',
            Label : 'Business Patner',
            Target : '@UI.FieldGroup#BusinessPatnerInformation',
        },
       
    ],
    
);

annotate StoreDB.BusinessPartner with {
    
State @(
        Common.Text: state.description,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList: {
            Label: 'States',
            CollectionPath: 'States',
            Parameters: [
                {
                    $Type: 'Common.ValueListParameterInOut',
                    LocalDataProperty: state_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'code'
                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description'
                }
            ]
        }
    );
};
