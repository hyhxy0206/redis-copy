include:
  - modules.database.redis.install


{{ pillar['redis_install_dir'] }}/conf/redis.conf:
  file.append:
      - text:
        - slaveof {{ pillar['redis_master_ip'] }} {{ pillar['redis_port'] }}
        - masterauth {{ pillar['redis_pass'] }}

slave-stop:
  service.dead:
    - name: redis_server.service

slave-start:
  service.running:
    - name: redis_server.service

