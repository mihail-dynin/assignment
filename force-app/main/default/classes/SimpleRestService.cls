public class SimpleRestService {
    public static List<ProductResponseWrap> getProducts() {
        List<ProductResponseWrap> products = new List<ProductResponseWrap>();

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:Products');
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200) {
            List<Object> deserializedResponse = (List<Object>)JSON.deserializeUntyped(response.getBody());
            for(Integer i = 0; i < deserializedResponse.size(); i++) {
                Map<String, Object> item = (Map<String, Object>)JSON.deserializeUntyped(JSON.serialize(deserializedResponse[i]));  // [{...}, {...}] -> "products": [{...}, {...}]
                products.add(new ProductResponseWrap(item));
	    }
        }
        return products;
    }

    public static Map<String, DiscountResponseWrap> getDiscounts() {
        Map<String, DiscountResponseWrap> discounts = new Map<String, DiscountResponseWrap>();

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:Discounts');
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200) {
	    List<Object> deserializedResponse = (List<Object>)JSON.deserializeUntyped(response.getBody());
            for(Integer i = 0; i < deserializedResponse.size(); i++) {
                Map<String, Object> item = (Map<String, Object>)JSON.deserializeUntyped(JSON.serialize(deserializedResponse[i]));
                DiscountResponseWrap discountWrap = new DiscountResponseWrap(item);
                discounts.put(String.valueOf(discountWrap.productId), discountWrap);
	    }
        }
        return discounts;
    }
}
