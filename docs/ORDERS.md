# Order Lifecycle Documentation

## Order Lifecycle States
```text
PENDING -> RESTAURANT_ACCEPTED -> PREPARING -> READY_FOR_PICKUP -> RIDER_ASSIGNED -> RIDER_ACCEPTED -> PICKED_UP -> OUT_FOR_DELIVERY -> DELIVERED
```
Alternative states: `REJECTED`, `CANCELLED`, `PAYMENT_FAILED`.

All status transitions are stored in `order_status_history`.
