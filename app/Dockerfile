# yntrumenq base imagey
FROM nginx:latest

# talisenq ashxatanqayn directory n
WORKDIR /usr/share/nginx/html

# jnjumenq nginx i default website y
RUN rm -rf ./*

# copy enq anum mer website y depi nginxi default website i texy
COPY website/ .

# te vor porti tak lsi website y
EXPOSE 80

# sksi nginx erb vor containery sarqvav
CMD ["nginx", "-g", "daemon off;"]
