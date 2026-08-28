# Database Documentation

## Database Engine
**Supabase PostgreSQL**

## Tables Schemas & Entities

1. `users`: Master user identity record.
2. `profiles`: Detailed profile information (name, avatar, phone).
3. `restaurants`: Restaurant directory details, location, status.
4. `restaurant_staff`: Staff to restaurant mappings.
5. `restaurant_categories`: Category taxonomies for restaurants.
6. `food_categories`: Food item classification categories.
7. `menu_items`: Food item details, prices, availability.
8. `addresses`: Customer saved delivery addresses.
9. `carts`: Customer shopping carts.
10. `cart_items`: Items within shopping carts.
11. `orders`: Main order master table.
12. `order_items`: Line items inside an order.
13. `riders`: Delivery partner details and online state.
14. `deliveries`: Active/historical delivery tasks for riders.
15. `payments`: Payment transaction logs and status.
16. `notifications`: User notification history.
17. `reviews`: Restaurant and food reviews.
18. `favorites`: Saved favorite restaurants for customers.
19. `coupons`: Discount vouchers and promo codes.
20. `order_status_history`: Historical audit trail of order status updates.

## Entity Relationship Summary
```text
User
 │
 ├── Customer
 │     ├── Addresses
 │     ├── Cart
 │     ├── Orders
 │     ├── Reviews
 │     └── Favorites
 │
 ├── Rider
 │     └── Deliveries
 │
 └── Restaurant Staff
       └── Restaurant
             ├── Categories
             ├── Menu Items
             └── Orders
```
