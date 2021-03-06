FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

## app/build --> folder with content of npm run build



FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

## default command of image is start nginx no need to do this step