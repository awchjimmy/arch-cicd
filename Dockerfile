## Dockerfile
FROM base/devel:latest

COPY ./archlive-entrypoint.sh /
RUN chmod +x /archlive-entrypoint.sh
ENTRYPOINT ["sh", "/archlive-entrypoint.sh"]
