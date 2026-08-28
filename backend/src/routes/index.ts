import { Router } from 'express';
import authRoutes from '../modules/auth';
import userRoutes from '../modules/users';
import restaurantRoutes from '../modules/restaurants';
import categoryRoutes from '../modules/categories';
import menuRoutes from '../modules/menu';
import cartRoutes from '../modules/carts';
import orderRoutes from '../modules/orders';
import riderRoutes from '../modules/riders';
import deliveryRoutes from '../modules/deliveries';
import paymentRoutes from '../modules/payments';
import notificationRoutes from '../modules/notifications';
import uploadRoutes from '../modules/uploads';
import adminRoutes from '../modules/admin';

const router = Router();

router.use('/auth', authRoutes);
router.use('/users', userRoutes);
router.use('/restaurants', restaurantRoutes);
router.use('/categories', categoryRoutes);
router.use('/', menuRoutes);
router.use('/carts', cartRoutes);
router.use('/orders', orderRoutes);
router.use('/rider', riderRoutes);
router.use('/deliveries', deliveryRoutes);
router.use('/payments', paymentRoutes);
router.use('/notifications', notificationRoutes);
router.use('/uploads', uploadRoutes);
router.use('/admin', adminRoutes);

export default router;
