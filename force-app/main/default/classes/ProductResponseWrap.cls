public class ProductResponseWrap {
        public Integer id;
        public String name;
        public Integer price;
        public String productCurrency;

    	public ProductResponseWrap(Map<String, Object> productsMap) {
            this.id = (Integer) productsMap.get('id');
            this.name = (String) productsMap.get('name');
            this.price = (Integer) productsMap.get('price');
            this.productCurrency = (String) productsMap.get('currency');
    }
}