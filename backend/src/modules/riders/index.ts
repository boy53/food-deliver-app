import { Router } from 'express';

const router = Router();

router.get('/deliveries', (req, res) => {
  res.json({ success: true, data: [{ id: 'delivery-1', status: 'ASSIGNED' }] });
});

router.post('/deliveries/:id/accept', (req, res) => {
  res.json({ success: true, data: { id: req.params.id, status: 'RIDER_ACCEPTED' } });
});

router.patch('/deliveries/:id/status', (req, res) => {
  res.json({ success: true, data: { id: req.params.id, status: req.body.status } });
});

router.post('/location', (req, res) => {
  res.json({ success: true, message: 'Location updated' });
});

export default router;
