import { LightningElement, wire, track } from 'lwc';
import getDiscount from '@salesforce/apex/DiscountService.getDiscount';

const columns = [
    { label: 'Product Name', fieldName: 'name' },
    { label: 'Price', fieldName: 'discountedPrice', type: 'currency', typeAttributes: { currencyCode: { fieldName: 'productCurrency' } } },
    { label: 'Discount', fieldName: 'discount', type: 'currency', typeAttributes: { currencyCode: { fieldName: 'productCurrency' } } },
];

export default class ProductView extends LightningElement {
    columns = columns;
    @track products = [];
    loading = false;

    connectedCallback() {
        this.getProducts();
    }

    getProducts() {
        this.loading = true;
        getDiscount()
            .then((data) => {
                this.products = data;
                this.error = undefined;
                this.loading = false;
            }
            )
            .catch((error) => {
                this.error = error;
                this.products = undefined;
            })
    }
}