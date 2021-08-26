public with sharing class ContactCreator {
    public static HttpResponse formstackAuth() {
        Integer clientId = 29864;
        String redirectStr = 'https://SQflex.formstack.com/forms/lead_form';
        String responseCode = 'code';

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://www.formstack.com/api/v2/oauth2/authorize?client_id=' + clientId + '&redirect_uri=' + redirectStr + '&response_type=' + responseCode );
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200){
           leadFormData();
        }
        return response;
    }
    
    public static httpResponse leadFormData(){
        String accessToken = 'Bearer 65770c352751a8acc41a43a3bfbac451';

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://www.formstack.com/api/v2/form/4501322/submission.json?data=true');
        request.setHeader('Authorization', accessToken);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200){
            Map<String, Object> submissions = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
            //System.debug(submissions);
            //System.debug((List<Object>)submissions.get('submissions'));
            List<Object> SubmissionsResults = (List<Object>)submissions.get('submissions');
            for (Integer i = 0; i < SubmissionsResults.size(); i++){
                Map<String, Object> insideData = (Map<String, Object>)SubmissionsResults[i];
                //System.debug(insideData);
                Map<String, Object> dataResults = (Map<String, Object>)insideData.get('data');
                //System.debug(dataResults);
                Map<String, Object> nameResults = (Map<String, Object>)dataResults.get('114477991');
                Map<String, Object> emailResults = (Map<String, Object>)dataResults.get('114353027');
                //System.debug(nameResults);
                String newName = (String)nameResults.get('value');
                String newEmail = (String)emailResults.get('value');
                //System.debug(newEmail);
                //System.debug(newName);
                Lead newLead =  new Lead();
                newLead.Lastname = newName;
                newLead.Email = newEmail;
                insert newLead;
            }
        }
        return response;    
    }
}