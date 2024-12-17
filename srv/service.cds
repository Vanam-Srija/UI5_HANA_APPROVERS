namespace my.shop;

using { my.approval.master as master } from '../db/Approvers';

define type ApproverData {
    emails : array of String;
}

service PurchaseApproval @(path: '/api/v1') {
    entity Approvers as projection on master.Approvers;
    function chooseApprover(totalPrice: Integer) returns array of String;
}


// service.cds
/* namespace my.shop;
using { my.approval.master as master } from '../db/Approvers';

service PurchaseApproval  @(path: '/api/v1') {
    entity Approvers as projection on master.Approvers;
    action chooseApprover(totalPrice: Decimal) returns array of String;
} */














/* namespace my.shop;

using { my.approval.master } from '../db/Approvers';

//using { approvalMaster } from '../db/Approvers'; // Adjust path based on your project structure

//@Capabilities.BatchSupported: false

define type DataString {
    value: String;
}
define type Approvers1 {
    value: String;
}

service PurchaseApproval @(path: '/api/v1') {
    //entity ApproverSet as projection on master.Approvers;
   //function getApprovers() returns array of Approvers;  // New function to return list of approvers

    function chooseApprover(totalPrice: Decimal(10, 2)) returns DataString;
    
} */