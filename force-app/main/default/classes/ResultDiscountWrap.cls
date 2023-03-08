public class ResultDiscountWrap {
    @AuraEnabled public Integer id;
    @AuraEnabled public String name;
    @AuraEnabled public String productCurrency;
    @AuraEnabled public Integer discount;
    @AuraEnabled public Integer discountedPrice;

    public ResultDiscountWrap(ProductResponseWrap product) {
        this.id = product.id;
        this.name = product.name;
        this.productCurrency = product.productCurrency;
        this.discount = 0;
        this.discountedPrice = product.price;
    }
    public ResultDiscountWrap(ProductResponseWrap product, DiscountResponseWrap discount) {
        this.id = product.id;
        this.name = product.name;
        this.productCurrency = product.productCurrency;
        this.discount = discount.discountPercentage != null ? (product.price * discount.discountPercentage) / 100 : discount.discountAmount;
        this.discountedPrice = discount.discountPercentage != null ? product.price - (product.price / discount.discountPercentage) : product.price - discount.discountAmount;
    }
}