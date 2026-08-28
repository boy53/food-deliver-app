import { Router } from 'express';

const router = Router();

router.get('/', (req, res) => {
  res.json({
    success: true,
    data: [
      { id: 'rest-1', name: 'Pizza Palace', rating: 4.8 },
      { id: 'rest-2', name: 'Burger Barn', rating: 4.5 },
    ],
  });
});

router.get('/:id', (req, res) => {
  res.json({ success: true, data: { id: req.params.id, name: 'Pizza Palace' } });
});

router.post('/', (req, res) => {
  res.status(201).json({ success: true, data: { id: 'rest-new', ...req.body } });
});

router.patch('/:id', (req, res) => {
  res.json({ success: true, data: { id: req.params.id, ...req.body } });
});

router.delete('/:id', (req, res) => {
  res.json({ success: true, message: 'Restaurant deleted' });
});

export default router;
