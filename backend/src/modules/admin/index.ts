import { Router } from 'express';

const router = Router();

router.get('/users', (req, res) => {
  res.json({ success: true, data: [] });
});

router.get('/restaurants', (req, res) => {
  res.json({ success: true, data: [] });
});

router.get('/riders', (req, res) => {
  res.json({ success: true, data: [] });
});

router.get('/orders', (req, res) => {
  res.json({ success: true, data: [] });
});

router.patch('/restaurants/:id', (req, res) => {
  res.json({ success: true, data: { id: req.params.id, ...req.body } });
});

router.patch('/riders/:id', (req, res) => {
  res.json({ success: true, data: { id: req.params.id, ...req.body } });
});

export default router;
