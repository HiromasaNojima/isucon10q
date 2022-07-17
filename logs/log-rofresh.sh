pt-query-digest /var/log/mysql/mysql-slow.log | tee digest_$(date +%Y%m%d-%H%M%S).txt
cat /var/log/nginx/access.log | alp json -m '/api/estate/[0-9a-zA-Z\-]+,/api/chair/[0-9a-zA-Z\-]+,/api/recommended_estate/[0-9a-zA-Z\-]+,/images/chair/[0-9a-zA-Z\-]+,/images/estate/[0-9a-zA-Z\-]+' --sort=avg -r | tee alp_$(date +%Y%m%d-%H%M%S).txt
mv /var/log/nginx/access.log /var/log/nginx/access.log.`date +%Y%m%d-%H%M%S`
rm /var/log/mysql/mysql-slow.log
nginx -s reopen
mysqladmin flush-logs