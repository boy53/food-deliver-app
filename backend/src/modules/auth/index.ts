import { Router } from 'express';
import jwt from 'jsonwebtoken';
import { environment } from '../../config/environment';

const router = Router();

router.post('/register', (req, res) => {
  const { email, password, role } = req.body;
  res.status(201).json({
    success: true,
    data: { id: 'user-123', email, role: role || 'CUSTOMER' },
  });
});

router.post('/login', (req, res) => {
  const { email, password } = req.body;
  const token = jwt.sign({ id: 'user-123', email, role: 'CUSTOMER' }, environment.jwtSecret);
  res.json({
    success: true,
    data: { token, user: { id: 'user-123', email, role: 'CUSTOMER' } },
  });
});

router.post('/logout', (req, res) => {
  res.json({ success: true, message: 'Logged out successfully' });
});

router.get('/me', (req, res) => {
  res.json({ success: true, data: { id: 'user-123', email: 'user@example.com', role: 'CUSTOMER' } });
});

export default router;
