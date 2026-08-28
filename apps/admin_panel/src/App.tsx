import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
import Dashboard from './pages/dashboard/Dashboard';
import Users from './pages/users/Users';
import Restaurants from './pages/restaurants/Restaurants';
import Riders from './pages/riders/Riders';
import Orders from './pages/orders/Orders';
import Payments from './pages/payments/Payments';
import Settings from './pages/settings/Settings';

export default function App() {
  return (
    <BrowserRouter>
      <div style={{ display: 'flex', minHeight: '100vh', fontFamily: 'sans-serif' }}>
        <nav style={{ width: '220px', background: '#1e293b', color: '#fff', padding: '1rem' }}>
          <h2>Admin Panel</h2>
          <ul style={{ listStyle: 'none', padding: 0 }}>
            <li style={{ margin: '10px 0' }}><Link to="/" style={{ color: '#fff' }}>Dashboard</Link></li>
            <li style={{ margin: '10px 0' }}><Link to="/users" style={{ color: '#fff' }}>Users</Link></li>
            <li style={{ margin: '10px 0' }}><Link to="/restaurants" style={{ color: '#fff' }}>Restaurants</Link></li>
            <li style={{ margin: '10px 0' }}><Link to="/riders" style={{ color: '#fff' }}>Riders</Link></li>
            <li style={{ margin: '10px 0' }}><Link to="/orders" style={{ color: '#fff' }}>Orders</Link></li>
            <li style={{ margin: '10px 0' }}><Link to="/payments" style={{ color: '#fff' }}>Payments</Link></li>
            <li style={{ margin: '10px 0' }}><Link to="/settings" style={{ color: '#fff' }}>Settings</Link></li>
          </ul>
        </nav>
        <main style={{ flex: 1, padding: '2rem', background: '#f8fafc' }}>
          <Routes>
            <Route path="/" element={<Dashboard />} />
            <Route path="/users" element={<Users />} />
            <Route path="/restaurants" element={<Restaurants />} />
            <Route path="/riders" element={<Riders />} />
            <Route path="/orders" element={<Orders />} />
            <Route path="/payments" element={<Payments />} />
            <Route path="/settings" element={<Settings />} />
          </Routes>
        </main>
      </div>
    </BrowserRouter>
  );
}
