import express from 'express';
import cors from 'cors';
import argon2 from 'argon2';
import jwt from 'jsonwebtoken';
import fetch from 'node-fetch';

const app = express();

app.use(cors());
app.use(express.json());

// CSP permissive example
app.use((req, res, next) => {
    res.setHeader("Content-Security-Policy", "default-src 'self'; img-src 'self' data:; script-src 'self'; style-src 'self' 'unsafe-inline'");
    next();
});

const PORT = 3000;
const DIRECTUS_URL = 'http://localhost:8055';
const ADMIN_TOKEN = 'PUNE_AICI_TOKENUL_ADMIN';
const JWT_SECRET = 'secretul_tau_jwt';

app.listen(PORT, () => console.log(`Server running on port ${PORT}`));

async function findUserByEmail(email) {
    const res = await fetch(`${DIRECTUS_URL}/items/site_users?filter[email][_eq]=${email}`, {
        headers: { 'Authorization': `Bearer ${ADMIN_TOKEN}` }
    });
    const data = await res.json();
    return data.data?.[0] || null;
}

app.post('/login', async (req, res) => {
    const { email, password } = req.body;
    const user = await findUserByEmail(email);

    if (!user) return res.status(401).json({ error: 'Invalid credentials' });

    const valid = await argon2.verify(user.password, password);
    if (!valid) return res.status(401).json({ error: 'Invalid credentials' });

    const token = jwt.sign(
        { id: user.id, email: user.email, role: user.role },
        JWT_SECRET,
        { expiresIn: '1h' }
    );

    res.json({
        access_token: token,
        user: {
            id: user.id,
            email: user.email,
            name: user.first_name,
            role: user.role
        }
    });
});
