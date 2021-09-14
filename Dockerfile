# build container
# https://www.udemy.com/course/docker-and-kubernetes-the-complete-guide/learn/lecture/22538182#overview
FROM node:alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Deploy container
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

