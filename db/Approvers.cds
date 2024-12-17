namespace my.approval.master;

entity Approvers {
    key ID : UUID;
    email : String;
    name : String;
    approvalValue : Integer;
}











/* namespace my.approval.master;

//context master{
entity Approvers {
    key ID           : UUID;
    name             : String(255);
    email            : String(255);
    approvalValue    : Integer;
}
//} */