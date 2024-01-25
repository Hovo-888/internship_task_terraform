
FROM nginx:latest


WORKDIR /usr/share/nginx/html


RUN rm -rf ./*


COPY website/ .


EXPOSE 80


CMD ["nginx", "-g", "daemon off;"]
