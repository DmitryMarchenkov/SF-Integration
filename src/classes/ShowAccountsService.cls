@RestResource(urlMapping='/account')
global class ShowAccountsService {

    @HTTPGet
    global static void getAccounts(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        String accType = req.params.get('type');
        System.debug('accType:>> ' + accType);
        
        List<Account> accounts = [SELECT Id, Name, Type FROM Account Where Type =: accType];
        System.debug('accounts:>> ' + accounts);
        
        if(!accounts.isEmpty()){
            String body = 'Accounts with type: ' + accType + '>>>\n';
            Integer count = 1;
            
            for(Account acc : accounts) {
                body += count++ + ' : ' + acc.Name + ';\n';
            }
            body += 'Count of accounts: ' + --count;
            res.responseBody = Blob.valueOf(body);
            count = 0;
        } else {
            res.responseBody = Blob.valueOf('No records found for type \'' + accType + '\'!');
        }
    }
}