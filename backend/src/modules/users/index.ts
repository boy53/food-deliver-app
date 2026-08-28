import { Router } from 'express';

const router = Router();

router.get('/', (req, res) => {
  res.json({ success: true, data: [{ id: 'user-123', email: 'user@example.com' }] });
});

export default router;
