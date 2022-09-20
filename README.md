# README

sudo service mysql stop 

docker-compose run app rake db:create  
docker-compose run app rake db:migrate

docker-compose build
docker-compose up
