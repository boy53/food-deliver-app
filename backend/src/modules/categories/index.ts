import { Router } from 'express';

const router = Router();

router.get('/', (req, res) => {
  res.json({ success: true, data: [{ id: 'cat-1', name: 'Italian' }] });
});

export default router;
