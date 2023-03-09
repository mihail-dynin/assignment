@isTest
public class DiscountServiceTest {
    @isTest
    static void getDiscountProductTest() {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('getProductsResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class, mock);
	    
        List<resultDiscountWrap> result = DiscountService.getDiscount();
	    
        System.assertNotEquals(null, result, 'The method should return something');
        System.assertEquals(4, result.size(), 'The list should contain 4 items');
    }

    @isTest
    static void getDiscountTest() {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('getDiscountsResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class, mock);
	    
        List<resultDiscountWrap> result = DiscountService.getDiscount();
	    
        System.assertNotEquals(null, result, 'The method should return something');
        System.assertEquals(2, result.size(), 'The list should contain 2 items');
    }
}
