import request from 'supertest';
import { app } from '../src/index';

describe('Backend API Integration Tests', () => {
  it('GET /api/v1/restaurants should return list of restaurants', async () => {
    const res = await request(app).get('/api/v1/restaurants');
    expect(res.status).toBe(200);
    expect(res.body.success).toBe(true);
    expect(Array.isArray(res.body.data)).toBe(true);
  });

  it('POST /api/v1/auth/login should return token', async () => {
    const res = await request(app)
      .post('/api/v1/auth/login')
      .send({ email: 'user@example.com', password: 'password123' });
    expect(res.status).toBe(200);
    expect(res.body.success).toBe(true);
    expect(res.body.data).toHaveProperty('token');
  });
});
