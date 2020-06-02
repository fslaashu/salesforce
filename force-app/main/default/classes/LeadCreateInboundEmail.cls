global class LeadCreateInboundEmail implements Messaging.InboundEmailHandler {
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, 
    Messaging.InboundEnvelope env){
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        String myPlainText= '';
        Lead newLead = new Lead();
        List<Lead> ins = new List<Lead>();

        myPlainText = email.plainTextBody;
        Dom.Document doc = new Dom.Document();  
        doc.load( myPlainText );  
        Dom.XMLNode rootElement = doc.getRootElement();  
        DOM.XMLNode newCustXMLNode = null;
        if(rootElement != null)
        {
            for (DOM.XMLNode DetailsRes : rootElement.getChildElements())
            {                
                if(DetailsRes.getName().equals('food'))
                {
                    for(DOM.XMLNode childElemnt : DetailsRes.getChildElements()){
                        system.debug('@@@@@form ');
                        newLead = new lead();
                        if(childElemnt.getName().equals('name')){
                            newLead.lastName = childElemnt.getText();
                            system.debug( childElemnt.getText() ); 
                        }
                        if(childElemnt.getName().equals('description')){
                            newLead.description = childElemnt.getText();
                            system.debug( childElemnt.getText() ); 
                        }
                        if(childElemnt.getName().equals('calories')){                            
                            newLead.company = childElemnt.getText();
                            system.debug( childElemnt.getText() ); 
                        }                        
                        newLead.email = email.fromAddress;
                        System.debug('@@@newLead'+newLead );
                        if(newLead.lastName==null){
                            continue;
                        }
                        ins.add(newLead);
                    }                    
                }
            }
        }

        if(ins.size()>0){
            insert ins;
        }
        result.success = true;
        return result;
    }    
}