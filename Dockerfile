FROM alpine:latest AS builder
RUN apk add --no-cache hugo git
WORKDIR /site
COPY . .
RUN hugo

FROM nginx:alpine
COPY --from=builder /site/public /usr/share/nginx/html
