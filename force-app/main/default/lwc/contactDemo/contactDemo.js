import { LightningElement, api, track, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import CONTACT_NAME_FIELD from '@salesforce/schema/Contact.Name';
import CONTACT_EMAIL_FIELD from '@salesforce/schema/Contact.Email';
const fields = [
    'Contact.Name',
    'Contact.Email',
    'Contact.Title',
    'Contact.Phone',
];


export default class ContactDemo extends LightningElement {

    // firstName = 'Raju';
    // lastName = 'Telugu';

    @track conData = {
        firstName : 'Suresh',
        lastName : 'Telugu'
    };

    @api recordId = '0035i000005sGjJAAU';
    fields = fields;
    
    @track data;
    // @wire(getRecord, { recordId: '$recordId', fields: [ 'Contact.Name', 'Contact.Email' ] } )
    //@wire(getRecord, { recordId: '$recordId', fields: fields } )
    //@wire(getRecord, { recordId: '$recordId', fields: [CONTACT_NAME_FIELD, CONTACT_EMAIL_FIELD ] } )
    //contact;

    @wire(getRecord, { recordId: '$recordId', fields: fields } )
    contact ({error, data}) {
        if (error) {
            console.log(error)
        } else if (data) {
            console.log(data);
            this.data = data;
        }
    }

    @api objectApiName;

    @api title = 'Contact Demo';

    constructor(){
        super();
        console.log(this.recordId);
        console.log(this.objectApiName);
        console.log(this.contact);
    }

    connectedCallback(){
        console.log(this.recordId);
        console.log(this.objectApiName);
        console.log(this.contact);
    }

    renderedCallback(){
        console.log(this.recordId);
        console.log(this.objectApiName);
        console.log(this.contact);
    }

    assignValue(event){
       const fieldName = event.target.name;
        if(fieldName === "firstName"){
            this.conData.firstName = event.target.value;
        }else if(fieldName === "lastName"){
            this.conData.lastName = event.target.value;
        }

        console.log(this.conData.firstName , this.conData.lastName);
    }

    // get name(){
    //     return this.contact.data.fields.Name.value;
    // }

    // get email(){
    //     return this.contact.data.fields.Email.value;
    // }
    // get titles() {
    //     return this.contact.data.fields.Title.value;
    // }

    // get phone() {
    //     return this.contact.data.fields.Phone.value;
    // }

    get name(){
        return this.data.fields.Name.value;
    }

    get email(){
        return this.data.fields.Email.value;
    }
    get titles() {
        return this.data.fields.Title.value;
    }

    get phone() {
        return this.data.fields.Phone.value;
    }


}