
ai in k3s cluster how to single task create 10 directories under /var/www/ naming it: s111.com bets.s111.com chat.s111.com food.s111.com jobs.s111.com love.s111.com ride.s111.com stay.s111.com teen.s111.com vote.s111.com and then in exact of 10 directories create index.html file that holds one line text the directory name, and then for each name under/etc/nginx/sites-available create files for each domain naming it exacly like the domain names, and then for each issue for each site sudo ln -s (example: sudo ln -s /etc/nginx/sites-available/s111.com /etc/nginx/sites-enabled/)

