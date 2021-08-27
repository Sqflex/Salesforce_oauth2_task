public with sharing class UploadMetadata implements Metadata.DeployCallback {
    public UploadMetadata() {

    }


    // Handle result implementation
    public void handleResult(Metadata.DeployResult result,
                             Metadata.DeployCallbackContext context) {
        if (result.status == Metadata.DeployStatus.Succeeded) {
            System.debug('success: ' + result);
        } else {
            System.debug('failure: ' + result);
        }
    }


    // Prepare Data for Lead_api__mdt
    public static Metadata.Lead_api__mdt prepareCustomMetadataRecord(String accessToken='Bearer 65770c352751a8acc41a43a3bfbac451', Integer clientId = 29864, 
    String redirectURL = 'https://SQflex.formstack.com/forms/lead_form', String responseType = 'code'){
        
        Metadata.Lead_api__mdt customMetadata =  new Metadata.Lead_api__mdt();
        customMetadata.Access_Token__c = accessToken;
        customMetadata.Client_Id__c = clientId;
        customMetadata.Redirect_URL__c = redirectURL;
        customMetadata.Response_Type__c = responseType;
        
        return customMetadata;
    }
}
