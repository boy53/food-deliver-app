-- Supabase PostgreSQL Schema Definition

CREATE TYPE user_role AS ENUM ('CUSTOMER', 'RESTAURANT', 'RIDER', 'ADMIN');
CREATE TYPE order_status AS ENUM ('PENDING', 'RESTAURANT_ACCEPTED', 'PREPARING', 'READY_FOR_PICKUP', 'RIDER_ASSIGNED', 'RIDER_ACCEPTED', 'PICKED_UP', 'OUT_FOR_DELIVERY', 'DELIVERED', 'REJECTED', 'CANCELLED', 'PAYMENT_FAILED');
CREATE TYPE payment_status AS ENUM ('PENDING', 'COMPLETED', 'FAILED', 'REFUNDED');

CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email VARCHAR(255) UNIQUE NOT NULL,
  phone VARCHAR(50) UNIQUE NOT NULL,
  role user_role NOT NULL DEFAULT 'CUSTOMER',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE profiles (
  id UUID PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
  full_name VARCHAR(255) NOT NULL,
  avatar_url VARCHAR(512),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE restaurants (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(255) NOT NULL,
  description TEXT,
  logo_url VARCHAR(512),
  banner_url VARCHAR(512),
  address TEXT NOT NULL,
  latitude DOUBLE PRECISION NOT NULL,
  longitude DOUBLE PRECISION NOT NULL,
  is_active BOOLEAN DEFAULT TRUE,
  rating NUMERIC(3,2) DEFAULT 0.0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE restaurant_staff (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  restaurant_id UUID REFERENCES restaurants(id) ON DELETE CASCADE,
  UNIQUE(user_id, restaurant_id)
);

CREATE TABLE restaurant_categories (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(100) UNIQUE NOT NULL,
  image_url VARCHAR(512)
);

CREATE TABLE food_categories (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  restaurant_id UUID REFERENCES restaurants(id) ON DELETE CASCADE,
  name VARCHAR(100) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE menu_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  restaurant_id UUID REFERENCES restaurants(id) ON DELETE CASCADE,
  category_id UUID REFERENCES food_categories(id) ON DELETE SET NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price NUMERIC(10,2) NOT NULL,
  image_url VARCHAR(512),
  is_available BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE addresses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  address_line TEXT NOT NULL,
  city VARCHAR(100),
  latitude DOUBLE PRECISION NOT NULL,
  longitude DOUBLE PRECISION NOT NULL,
  is_default BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE carts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID UNIQUE REFERENCES users(id) ON DELETE CASCADE,
  restaurant_id UUID REFERENCES restaurants(id) ON DELETE SET NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE cart_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  cart_id UUID REFERENCES carts(id) ON DELETE CASCADE,
  menu_item_id UUID REFERENCES menu_items(id) ON DELETE CASCADE,
  quantity INT NOT NULL DEFAULT 1
);

CREATE TABLE riders (
  id UUID PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
  vehicle_type VARCHAR(50),
  license_plate VARCHAR(50),
  is_online BOOLEAN DEFAULT FALSE,
  current_latitude DOUBLE PRECISION,
  current_longitude DOUBLE PRECISION,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  customer_id UUID REFERENCES users(id) ON DELETE SET NULL,
  restaurant_id UUID REFERENCES restaurants(id) ON DELETE SET NULL,
  rider_id UUID REFERENCES users(id) ON DELETE SET NULL,
  address_id UUID REFERENCES addresses(id) ON DELETE SET NULL,
  status order_status NOT NULL DEFAULT 'PENDING',
  total_amount NUMERIC(10,2) NOT NULL,
  delivery_fee NUMERIC(10,2) DEFAULT 0.00,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE order_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id UUID REFERENCES orders(id) ON DELETE CASCADE,
  menu_item_id UUID REFERENCES menu_items(id) ON DELETE SET NULL,
  quantity INT NOT NULL,
  unit_price NUMERIC(10,2) NOT NULL
);

CREATE TABLE deliveries (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id UUID UNIQUE REFERENCES orders(id) ON DELETE CASCADE,
  rider_id UUID REFERENCES users(id) ON DELETE SET NULL,
  pickup_time TIMESTAMP WITH TIME ZONE,
  delivered_time TIMESTAMP WITH TIME ZONE,
  status VARCHAR(50) DEFAULT 'ASSIGNED'
);

CREATE TABLE payments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id UUID UNIQUE REFERENCES orders(id) ON DELETE CASCADE,
  amount NUMERIC(10,2) NOT NULL,
  status payment_status NOT NULL DEFAULT 'PENDING',
  payment_method VARCHAR(50) NOT NULL,
  transaction_id VARCHAR(255),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE notifications (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  is_read BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE reviews (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id UUID REFERENCES orders(id) ON DELETE CASCADE,
  customer_id UUID REFERENCES users(id) ON DELETE CASCADE,
  restaurant_id UUID REFERENCES restaurants(id) ON DELETE CASCADE,
  rating INT CHECK (rating >= 1 AND rating <= 5),
  comment TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE favorites (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  restaurant_id UUID REFERENCES restaurants(id) ON DELETE CASCADE,
  UNIQUE(user_id, restaurant_id)
);

CREATE TABLE coupons (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code VARCHAR(50) UNIQUE NOT NULL,
  discount_amount NUMERIC(10,2) NOT NULL,
  min_order_amount NUMERIC(10,2) DEFAULT 0.00,
  is_active BOOLEAN DEFAULT TRUE,
  expires_at TIMESTAMP WITH TIME ZONE
);

CREATE TABLE order_status_history (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id UUID REFERENCES orders(id) ON DELETE CASCADE,
  status order_status NOT NULL,
  changed_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  notes TEXT
);
