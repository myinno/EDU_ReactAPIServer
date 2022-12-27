  #!/bin/bash
  source ~/.bash_profile
  cd ~/git/backfront/
  git pull origin main
  cd frontend/
  npm i
  npm run build
  cp -rf dist/* ../backend/public
  cd ../backend/
  npm i
  pm2 stop web
  pm2 start bin/www --name web --update-env
  sleep 2
  pm2 list
