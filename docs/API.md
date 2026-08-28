# API Architecture & Endpoints Documentation

## Base URL
`https://api.yourdomain.com/api/v1`

## API Endpoints Overview

### Authentication
- `POST /auth/register` - Create new user account
- `POST /auth/login` - Authenticate user & issue tokens
- `POST /auth/logout` - Invalidate user session
- `GET /auth/me` - Fetch currently authenticated user details

### Restaurants & Menu
- `GET /restaurants` - Search/list restaurants
- `GET /restaurants/:id` - Fetch restaurant details
- `POST /restaurants` - Create restaurant (Admin/Staff)
- `PATCH /restaurants/:id` - Update restaurant info
- `DELETE /restaurants/:id` - Delete restaurant
- `GET /restaurants/:id/menu` - Get menu items for restaurant
- `POST /menu` - Add menu item
- `PATCH /menu/:id` - Update menu item
- `DELETE /menu/:id` - Delete menu item

### Orders
- `POST /orders` - Create new order
- `GET /orders` - List user orders
- `GET /orders/:id` - Get order details
- `PATCH /orders/:id/status` - Update order status
- `POST /orders/:id/cancel` - Cancel order

### Rider & Delivery
- `GET /rider/deliveries` - Fetch assigned/available deliveries
- `POST /rider/deliveries/:id/accept` - Accept delivery request
- `PATCH /rider/deliveries/:id/status` - Update delivery execution status
- `POST /rider/location` - Report live rider geolocation coordinates

### Admin Management
- `GET /admin/users` - Manage platform users
- `GET /admin/restaurants` - Manage restaurants
- `GET /admin/riders` - Manage riders
- `GET /admin/orders` - View platform-wide orders
- `PATCH /admin/restaurants/:id` - Approve/update restaurant
- `PATCH /admin/riders/:id` - Approve/update rider
