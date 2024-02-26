# To create artifcats
1. Set `export REACT_APP_BACKEND_URL=<LOADBALANCER or Gatewway URL>`
2. npm run build
3. aws s3 cp build/ s3://< bucketname >  --recursive