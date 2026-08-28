export interface ApiResponse<T> {
  success: boolean;
  data?: T;
  error?: string;
}

export interface CreateOrderRequest {
  restaurantId: string;
  addressId: string;
  items: Array<{
    menuItemId: string;
    quantity: number;
  }>;
}

export interface UpdateOrderStatusRequest {
  status: string;
  notes?: string;
}
