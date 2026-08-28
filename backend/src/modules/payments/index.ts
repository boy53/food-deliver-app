import { Router } from 'express';

const router = Router();

router.post('/checkout', (req, res) => {
  res.json({ success: true, data: { paymentId: 'pay-123', status: 'COMPLETED' } });
});

export default router;
