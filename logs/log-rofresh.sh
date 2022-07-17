pt-query-digest /var/log/mysql/mysql-slow.log | tee digest_$(date +%Y%m%d-%H%M%S).txt
cat /var/log/nginx/access.log | alp json -m '/api/estate/[0-9]+,/api/chair/[0-9]+,/api/recommended_estate/[0-9]+,/images/chair/[0-9]+,/images/estate/[0-9]+,/api/chair/buy/[0-9]+,/api/estate/req_doc/[0-9]+' --sort=avg -r | tee alp_$(date +%Y%m%d-%H%M%S).txt
mv /var/log/nginx/access.log /var/log/nginx/access.log.`date +%Y%m%d-%H%M%S`
rm /var/log/mysql/mysql-slow.log
nginx -s reopen
mysqladmin flush-logs
