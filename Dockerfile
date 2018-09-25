## Dockerfile
FROM base/archlinux:latest

COPY ./archlive-entrypoint.sh /
RUN chmod +x /archlive-entrypoint.sh

COPY ./user-packages.x86_64 /

ENTRYPOINT ["sh", "/archlive-entrypoint.sh"]
