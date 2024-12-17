const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
    const { Approvers } = this.entities;

    this.on('chooseApprover', async (req) => {
        try {
            const { totalPrice } = req.data;
            const approvers = await SELECT.from(Approvers).orderBy('approvalValue asc');
            if (approvers.length === 0) {
                return []; 
            }
            if (totalPrice < approvers[0].approvalValue) {
                return ['autoapproved'];  
            }
            let selectedEmails = [];
            for (const approver of approvers) {
                if (totalPrice >= approver.approvalValue) {
                    selectedEmails.push(approver.email);
                }
            }

            return selectedEmails.length > 0 ? selectedEmails : ['autoapproved'];

        } catch (error) {
            console.error('Error during approver selection:', error);
            return [];
        }
    });
});
