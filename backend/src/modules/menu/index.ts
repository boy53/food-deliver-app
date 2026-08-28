import { Router } from 'express';

const router = Router();

router.get('/restaurants/:id/menu', (req, res) => {
  res.json({
    success: true,
    data: [{ id: 'item-1', name: 'Pepperoni Pizza', price: 12.99 }],
  });
});

router.post('/menu', (req, res) => {
  res.status(201).json({ success: true, data: { id: 'item-new', ...req.body } });
});

router.patch('/menu/:id', (req, res) => {
  res.json({ success: true, data: { id: req.params.id, ...req.body } });
});

router.delete('/menu/:id', (req, res) => {
  res.json({ success: true, message: 'Menu item deleted' });
});

export default router;
