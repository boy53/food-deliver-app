# Authentication & Authorization Documentation

## Overview
Authentication is handled via JWT tokens and Firebase/Supabase Auth integration. Authorization is enforced using Role-Based Access Control (RBAC).

## Roles
1. **CUSTOMER**: Can place orders, manage carts, track deliveries, edit personal profile.
2. **RESTAURANT**: Can manage restaurant details, menu items, update order preparation state.
3. **RIDER**: Can accept delivery requests, update delivery journey status, broadcast live location.
4. **ADMIN**: Full administrative control across all users, restaurants, riders, orders, and system settings.

## Access Hierarchy
```text
Customer    --> Customer permissions
Restaurant  --> Restaurant permissions
Rider       --> Rider permissions
Admin       --> Platform-wide management permissions
```
