global class LeadCreationScheduler implements Schedulable {
    global void execute(SchedulableContext sc) {
        ContactCreator.formstackAuth();
    }
}
