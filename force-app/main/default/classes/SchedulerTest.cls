@isTest
private class SchedulerTest {
    class gotAllTheJsonInfo implements HttpCalloutMock{
        public HttpResponse respond(HttpRequest request) {
            HttpResponse res = new HttpResponse();
            res.setBody('{ "submissions": [ { "id": "853086294", "timestamp": "2021-08-27 11:40:57", "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36", "remote_addr": "212.98.190.44", "payment_status": "", "latitude": "53.900001525879", "longitude": "27.566699981689", "read": "0", "data": { "114353027": { "field": "114353027", "label": "Email", "type": "email", "value": "egor.golubev@email.com" }, "114477991": { "field": "114477991", "label": "Name and Surname", "type": "text", "value": "Egor Golubev" }, "114530260": { "field": "114530260", "label": "Company", "type": "text", "value": "Apex" } } }, { "id": "853086419", "timestamp": "2021-08-27 11:41:12", "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36", "remote_addr": "212.98.190.44", "payment_status": "", "latitude": "53.900001525879", "longitude": "27.566699981689", "read": "0", "data": { "114353027": { "field": "114353027", "label": "Email", "type": "email", "value": "Acrobat@gmail.com" }, "114477991": { "field": "114477991", "label": "Name and Surname", "type": "text", "value": "Yuri Skrobat" }, "114530260": { "field": "114530260", "label": "Company", "type": "text", "value": "onilab" } } }, { "id": "854892096", "timestamp": "2021-09-01 05:27:12", "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36", "remote_addr": "212.98.190.44", "payment_status": "", "latitude": "53.900001525879", "longitude": "27.566699981689", "read": "0", "data": { "114353027": { "field": "114353027", "label": "Email", "type": "email", "value": "randomemail@email.com" }, "114477991": { "field": "114477991", "label": "Name and Surname", "type": "text", "value": "Random guy" }, "114530260": { "field": "114530260", "label": "Company", "type": "text", "value": "Apex" } } } ], "total": 3, "pages": 1, "pretty_field_id": "114353027" }');
            res.setStatusCode(200);
            return res;
        }
    }
    public static String CRON_EXP = '0 5 * * * * *';
    static testMethod void testScheduledJob(){
        Lead custom = new Lead(Lastname = 'Egor Golubev',
        Email = 'egor.golubev@email.com',
        Company = 'Apex');
        insert custom;

        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new gotAllTheJsonInfo());
        String jobId = System.schedule('ScheduledLeadTest', CRON_EXP, new LeadCreationScheduler());
        Test.stopTest();
    }


}
