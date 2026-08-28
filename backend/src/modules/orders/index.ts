import { Router } from 'express';

const router = Router();

router.post('/', (req, res) => {
  res.status(201).json({
    success: true,
    data: { id: 'order-123', status: 'PENDING', totalAmount: 25.5 },
  });
});

router.get('/', (req, res) => {
  res.json({ success: true, data: [{ id: 'order-123', status: 'PENDING' }] });
});

router.get('/:id', (req, res) => {
  res.json({ success: true, data: { id: req.params.id, status: 'PENDING' } });
});

router.patch('/:id/status', (req, res) => {
  const { status } = req.body;
  res.json({ success: true, data: { id: req.params.id, status } });
});

router.post('/:id/cancel', (req, res) => {
  res.json({ success: true, data: { id: req.params.id, status: 'CANCELLED' } });
});

export default router;
