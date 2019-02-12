cd /root/redash-delete-queue
/bin/docker exec -i redash_redis_1 redis-cli < redis-command.txt 
/bin/docker exec -i redash_redis_1 redis-cli < redis-command.txt > .delete.task
sed -e 's/^/zrem query_task_trackers:in_progress /g' .delete.task >> delete-command.txt
/bin/docker exec -i redash_redis_1 redis-cli < delete-command.txt
