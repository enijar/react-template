# App

React app.

### Required Software

- NodeJS 14

### Getting Started

```bash
cp .env.example .env
npm install
npm start # http://localhost:3000
```

### Deploy

NGINX

```nginx
server {
    listen 80;
    server_name _;

    location / {
        index index.html;
        root /var/www/app/releases/latest;
        try_files $uri $uri/ /index.html =404;
        expires 1M;
        access_log off;
        add_header Cache-Control "public";
        absolute_redirect off;
    }
}
```

Build

```bash
cp .env.example .env
npm install
npm run build # outputs to releases/latest
```
