FROM alpine:latest AS builder
RUN apk add --no-cache hugo git
WORKDIR /site
COPY . .
RUN git submodule update --init --recursive
RUN hugo

FROM nginx:alpine
COPY --from=builder /site/public /usr/share/nginx/html
