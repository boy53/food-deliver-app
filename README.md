# Food Delivery Platform

A complete, production-ready food delivery platform consisting of mobile applications for Customers, Riders, and Restaurants, an Admin Web Panel, and a centralized shared Backend API.

## Repository Architecture

```text
food_delivery/
│
├── apps/
│   ├── customer_app/      # Flutter Mobile App for Customers
│   ├── rider_app/         # Flutter Mobile App for Riders
│   ├── restaurant_app/    # Flutter Mobile App for Restaurants
│   └── admin_panel/       # React/TypeScript Web Panel
│
├── backend/               # Express/Node.js TypeScript API Server
├── database/              # Supabase PostgreSQL Schemas & Migrations
├── packages/              # Shared models, contracts, and constants
├── docs/                  # Architecture & System Documentation
└── scripts/               # Maintenance & Deployment Scripts
```

## Tech Stack

- **Customer Mobile App**: Flutter / Dart
- **Rider Mobile App**: Flutter / Dart
- **Restaurant Mobile App**: Flutter / Dart
- **Admin Panel**: React / TypeScript / Vite / Tailwind CSS
- **Backend API**: Node.js / Express / TypeScript
- **Database**: Supabase PostgreSQL
- **File Storage**: Cloudflare R2
- **Notifications**: Firebase FCM
- **Location Services**: Maps API

## Core Architecture Principle

All applications communicate through the central **Backend API**. Mobile apps and the admin panel do not directly communicate with each other.

## Getting Started

1. Copy `.env.example` to `.env` in the root and configure environment variables.
2. Read the documentation in `docs/` for detailed architectural specs.
