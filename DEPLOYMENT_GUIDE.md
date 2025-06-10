# Rainy-Dayz Server Heroku Deployment Guide

## Prerequisites
- Heroku CLI installed
- Git configured
- Heroku account

## Quick Deployment Steps

1. **Authenticate with Heroku:**
   ```bash
   heroku login
   ```

2. **Run the deployment script:**
   ```bash
   ./deploy_to_heroku.sh
   ```

## Manual Deployment Steps

1. **Create Heroku app:**
   ```bash
   APP_NAME="rainy-dayz-server-$(date +%s)"
   heroku create $APP_NAME
   ```

2. **Add PostgreSQL database:**
   ```bash
   heroku addons:create heroku-postgresql:hobby-dev --app $APP_NAME
   ```

3. **Set environment variables:**
   ```bash
   heroku config:set \
     NODE_ENV=production \
     SECRET="$(openssl rand -hex 32)" \
     SECRET_JS="$(openssl rand -hex 32)" \
     TELEGRAM_TOKEN="your_telegram_token" \
     GMAIL_USERNAME="your_gmail_username" \
     GMAIL_APP_PASSWORD="your_gmail_app_password" \
     --app $APP_NAME
   ```

4. **Deploy the code:**
   ```bash
   heroku git:remote -a $APP_NAME
   git push heroku HEAD:main
   ```

5. **Test the deployment:**
   ```bash
   curl https://$APP_NAME.herokuapp.com/api/test/health
   ```

## Environment Variables to Update

Replace these placeholder values with actual credentials:
- `TELEGRAM_TOKEN`: Your Telegram bot token
- `GMAIL_USERNAME`: Your Gmail username
- `GMAIL_APP_PASSWORD`: Your Gmail app password

## Database Migration

The app originally used MongoDB but has been configured for PostgreSQL on Heroku.
The DATABASE_URL environment variable is automatically set by the PostgreSQL addon.

## Health Check

The app includes a health check endpoint at `/api/test/health` that returns:
```json
{
  "status": "OK",
  "timestamp": "2025-06-10T02:50:00.000Z",
  "service": "rainy-dayz-server"
}
```

## Troubleshooting

- Check logs: `heroku logs --tail --app your-app-name`
- Restart app: `heroku restart --app your-app-name`
- Check config: `heroku config --app your-app-name`