FROM node:alpine
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

#/app/build  will have the files

FROM nginx
EXPOSE 80
COPY --force=0 /app/build /usr/share/nginx/html
