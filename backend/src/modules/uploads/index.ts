import { Router } from 'express';

const router = Router();

router.post('/upload-url', (req, res) => {
  res.json({
    success: true,
    data: { uploadUrl: 'https://r2.yourdomain.com/upload', fileKey: 'file-123' },
  });
});

export default router;
