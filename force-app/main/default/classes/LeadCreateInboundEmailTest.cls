@isTest
public class LeadCreateInboundEmailTest {
    @isTest
    public static void LeadCreateInboundEmailTest() {
        Messaging.InboundEmail email = new Messaging.InboundEmail() ;
        Messaging.InboundEnvelope env    = new Messaging.InboundEnvelope();        
        email.plainTextBody = 'FromEmail';
        email.fromName = 'Ashwin Pandey';
        email.fromAddress = 'test@salesforce.com';
        email.plainTextBody = 'Create Lead';
        LeadCreateInboundEmail lcreate = new LeadCreateInboundEmail();
        lcreate.handleInboundEmail(email,env);
    }
}