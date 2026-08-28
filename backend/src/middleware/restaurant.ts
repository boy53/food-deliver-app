import { requireRole } from './admin';
export const restaurantMiddleware = requireRole('RESTAURANT');
