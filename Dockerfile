FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm i
COPY . .
RUN npm run build

## app/build --> folder with content of npm run build



FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

## default command of image is start nginx no need to do this step