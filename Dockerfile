FROM nginx:alpine
EXPOSE 80
ENV LISTEN_PORT=80 \
  SERVER_URL=otrecorder \
  SERVER_PORT=80

COPY nginx.tmpl /etc/nginx/nginx.tmpl
COPY index.html /usr/share/nginx/html
COPY static/ /usr/share/nginx/html/static/
RUN ls /usr/share/nginx/html/*
CMD /bin/sh -c "envsubst '\${SERVER_URL} \${SERVER_PORT} \${LISTEN_PORT}' < /etc/nginx/nginx.tmpl > /etc/nginx/nginx.conf && nginx -g 'daemon off;' || cat /etc/nginx/nginx.conf"

