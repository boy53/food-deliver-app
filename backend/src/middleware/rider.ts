import { requireRole } from './admin';
export const riderMiddleware = requireRole('RIDER');
