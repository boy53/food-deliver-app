# High-Level Architecture Documentation

## Overview
The Food Delivery Platform is built as a unified monorepo system consisting of three Flutter mobile applications (Customer, Rider, Restaurant), a React/TypeScript Admin Panel, a shared Node.js/TypeScript Backend API, Supabase PostgreSQL, Cloudflare R2 Storage, Firebase Cloud Messaging (FCM), Maps, and Payment provider services.

## Core Architecture Principles
1. **Centralized Communication**: All frontend clients communicate strictly through the Backend API.
2. **Decoupled Client Interfaces**: Applications do not communicate with each other directly.
3. **Role-Based Access Control**: Strict access level controls for Customer, Rider, Restaurant Staff, and Admin roles.
4. **Stateless Backend**: The API is designed to be horizontally scalable and stateless.

## Core Component Diagram
```text
                         FOOD DELIVERY PLATFORM
                                  │
             ┌────────────────────┼────────────────────┐
             │                    │                    │
             ▼                    ▼                    ▼
      Customer App           Rider App          Restaurant App
        Flutter                Flutter               Flutter
             │                    │                    │
             └────────────────────┼────────────────────┘
                                  │
                                  ▼
                         ┌─────────────────┐
                         │   Backend API   │
                         │ Cloudflare      │
                         │ Workers/Server  │
                         └────────┬────────┘
                                  │
              ┌───────────────────┼───────────────────┐
              │                   │                   │
              ▼                   ▼                   ▼
        ┌───────────┐       ┌────────────┐      ┌─────────────┐
        │ Supabase  │       │ Cloudflare │      │  Firebase   │
        │ PostgreSQL│       │     R2     │      │    FCM      │
        │ Database  │       │   Storage  │      │ Notifications│
        └───────────┘       └────────────┘      └─────────────┘
                                  │
                                  │
                            ┌─────▼─────┐
                            │   Maps    │
                            │  Service  │
                            └───────────┘

                         ┌─────────────────┐
                         │   Admin Panel   │
                         │ React/TypeScript│
                         └────────┬────────┘
                                  │
                                  ▼
                             Backend API
```
