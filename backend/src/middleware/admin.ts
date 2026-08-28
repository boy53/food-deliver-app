import { Response, NextFunction } from 'express';
import { AuthRequest } from './auth';

export const requireRole = (role: string) => {
  return (req: AuthRequest, res: Response, next: NextFunction) => {
    if (!req.user || req.user.role !== role) {
      return res.status(403).json({ success: false, error: `Forbidden: Requires ${role} role` });
    }
    next();
  };
};

export const adminOnly = requireRole('ADMIN');
export const restaurantOnly = requireRole('RESTAURANT');
export const riderOnly = requireRole('RIDER');
