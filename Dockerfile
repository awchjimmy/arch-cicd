## Dockerfile
FROM base/archlinux:latest

COPY ./archlive-entrypoint.sh /
RUN chmod +x /archlive-entrypoint.sh
ENTRYPOINT ["sh", "/archlive-entrypoint.sh"]
