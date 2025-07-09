import fetch from 'node-fetch';

const BASE_URL = 'http://localhost:3000';

async function testRegisterAndLogin() {
    const user = {
        first_name: 'Sorin',
        email: 'sorin@email.com',
        password: 'parola123'
    };

    // 1. Register
    console.log('Registering user...');
    let res = await fetch(`${BASE_URL}/register`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(user)
    });
    let data = await res.json();
    console.log('Register response:', data);

    if (!res.ok && data.error === 'User already exists') {
        console.log('User already exists, proceeding to login...');
    } else if (!res.ok) {
        console.error('Register failed:', data);
        return;
    }

    // 2. Login
    console.log('Logging in user...');
    res = await fetch(`${BASE_URL}/login`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email: user.email, password: user.password })
    });
    data = await res.json();
    console.log('Login response:', data);

    if (!res.ok) {
        console.error('Login failed:', data.error);
        return;
    }

    console.log('Access token:', data.access_token);
}

testRegisterAndLogin().catch(console.error);
