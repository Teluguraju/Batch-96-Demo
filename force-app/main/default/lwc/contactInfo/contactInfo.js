import { LightningElement, api, track, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import Account_NAME_FIELD from '@salesforce/schema/Account.Name';
import ACCOUNT_INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';

const fields = [
    'Account.Name',
    'Account.Industry'
];

export default class ContactInfo extends LightningElement {

    // firstName = 'Miquel';
    // lastName = 'Monroy';


    @track person = {
        firstName: 'Raju',
        lastName: 'Telugu'
    };

    @api title = 'Con Info';
    fields = fields;

    @api recordId ='0015i00000qpxgcAAA';
    @api objectApiName;
    // @wire(getRecord, { recordId: '$recordId', fields: [ Account_NAME_FIELD, ACCOUNT_INDUSTRY_FIELD ] } )
    // @wire(getRecord, { recordId: '$recordId', fields: [ 'Account.Name', 'Account.Industry' ] } )
    // @wire(getRecord, { recordId: '$recordId', fields: fields } )
    // account;

    @track data;
    
    @wire(getRecord, { recordId: '$recordId', fields: fields } )
    account ({error, data}) {
        if (error) {
           console.log(error);
        } else if (data) {
            console.log('********', data);
            this.data = data;
        }
    }

    constructor(){
        super();
        console.log('record id from constructor'+this.recordId);
        console.log('object api name from constructor'+this.objectApiName);
        console.log('account from constructor'+this.account);
        
    }

    connectedCallback(){
        console.log('cc '+this.recordId);
        console.log('cc '+this.objectApiName);
        console.log('cc'+this.account);
        
    }

    renderedCallback(){
        console.log('rrc'+this.recordId);
        console.log('rrc'+this.objectApiName);
        console.log('rrc'+this.account);
       
    }

    assignValue(event){
        const fieldName = event.target.name;
        if(fieldName === "firstName"){
            this.person.firstName = event.target.value;
        }
        else if(fieldName === "lastName"){
            this.person.lastName = event.target.value;
        }
        console.log(this.person.firstName , this.person.lastName);

        console.log('*****Raju****');
    }

    get name(){
        return this.data.fields.Name.value;
    }
    get industry(){
        return this.data.fields.Industry.value;
    }
}