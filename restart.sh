docker-compose restart $1 && docker-compose logs --tail=200 -f $1
