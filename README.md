# Rainy-Dayz Server - Heroku Deployment Ready

This repository contains the rainy-dayz-server configured and ready for Heroku deployment with PostgreSQL database.

## Quick Start

1. Clone this repository
2. Install Heroku CLI
3. Run `heroku login`
4. Execute `./deploy_to_heroku.sh`

## Features

- ✅ Node.js/Express server
- ✅ PostgreSQL database ready
- ✅ Environment variables configured
- ✅ Health check endpoint
- ✅ Heroku Procfile
- ✅ Deployment script included

## Deployment

See [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md) for detailed instructions.

## Environment Variables Needed

- `TELEGRAM_TOKEN`: Your Telegram bot token
- `GMAIL_USERNAME`: Your Gmail username  
- `GMAIL_APP_PASSWORD`: Your Gmail app password
- `SECRET`: Auto-generated encryption key
- `SECRET_JS`: Auto-generated JS encryption key

## Health Check

Once deployed, test with: `https://your-app-name.herokuapp.com/api/test/health`
