#!/bin/bash

docker-compose up -d
docker login -u katikelaashwini123 -p dckr_pat_SAOYg8xl-gP5bz_impvevY8Hq60
docker tag reactapp katikelaashwini123/yashuproject-prod
docker push katikelaashwini123/yashuproject-prod
