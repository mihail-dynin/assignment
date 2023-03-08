public class DiscountService {
    @AuraEnabled
    public static List<ResultDiscountWrap> getDiscount() {
        List<ProductResponseWrap> products = SimpleRestService.getProducts();
        Map<String, DiscountResponseWrap> discounts = SimpleRestService.getDiscounts();

        List<ResultDiscountWrap> result = new List<ResultDiscountWrap>();

        for(Integer i = 0; i < products.size(); ++i) {
            ResultDiscountWrap processedProduct;
            if(discounts.containsKey(String.valueOf(products[i].id))) {
                processedProduct = new ResultDiscountWrap(products[i], discounts.get(String.valueOf(products[i].id)));
            } else {
                processedProduct = new ResultDiscountWrap(products[i]);
            }
            result.add(processedProduct);
        }
        return result;
    }
}