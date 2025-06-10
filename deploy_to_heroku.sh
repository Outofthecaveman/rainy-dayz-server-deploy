#!/bin/bash

# Heroku deployment script for rainy-dayz-server
APP_NAME="rainy-dayz-server-$(date +%s)"

echo "Creating Heroku app: $APP_NAME"
heroku create $APP_NAME

echo "Adding PostgreSQL addon..."
heroku addons:create heroku-postgresql:hobby-dev --app $APP_NAME

echo "Setting environment variables..."
heroku config:set \
  NODE_ENV=production \
  SECRET="$(openssl rand -hex 32)" \
  SECRET_JS="$(openssl rand -hex 32)" \
  TELEGRAM_TOKEN="PLACEHOLDER_TELEGRAM_TOKEN" \
  GMAIL_USERNAME="PLACEHOLDER_GMAIL_USERNAME" \
  GMAIL_APP_PASSWORD="PLACEHOLDER_GMAIL_APP_PASSWORD" \
  --app $APP_NAME

echo "Adding git remote and deploying..."
heroku git:remote -a $APP_NAME
git add .
git commit -m "Deploy to Heroku"
git push heroku HEAD:main

echo "App deployed at: https://$APP_NAME.herokuapp.com"
echo "Health check: https://$APP_NAME.herokuapp.com/api/test/health"