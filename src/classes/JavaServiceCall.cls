public class JavaServiceCall {
	
    public static void callSideService(){
    	Http h = new Http();

    	HttpRequest request = new HttpRequest();
    	request.setEndpoint('https://pure-escarpment-22484.herokuapp.com/');
    	request.setMethod('GET');

	    HttpResponse res = h.send(request);
	    System.debug('res.getBody() >>> ' + res.getBody());
    }
}