# Build application
FROM node:16 as builder
ADD . /app
WORKDIR /app
RUN npm install
RUN npm run build

# Create server
FROM nginx:1.16-alpine
COPY --from=builder /app/public /usr/share/nginx/html
