export interface User {
  id: string;
  email: string;
  phone: string;
  role: 'CUSTOMER' | 'RESTAURANT' | 'RIDER' | 'ADMIN';
  createdAt: string;
}

export interface Restaurant {
  id: string;
  name: string;
  description: string;
  address: string;
  latitude: number;
  longitude: number;
  rating: number;
}

export interface MenuItem {
  id: string;
  restaurantId: string;
  name: string;
  description: string;
  price: number;
  isAvailable: boolean;
}

export interface Order {
  id: string;
  customerId: string;
  restaurantId: string;
  riderId?: string;
  status: string;
  totalAmount: number;
  createdAt: string;
}
