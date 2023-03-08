public class DiscountResponseWrap {
	public Integer productId;
    public Integer discountPercentage;
    public Integer discountAmount;

    public DiscountResponseWrap(Map<String, Object> discountsMap) {
        this.productId = (Integer) discountsMap.get('productId');
        this.discountPercentage = (Integer) (discountsMap.get('discountPercentage') != null ? discountsMap.get('discountPercentage') : null);
        this.discountAmount = (Integer) (discountsMap.get('discountAmount') != null ? discountsMap.get('discountAmount') : null);
    }
}