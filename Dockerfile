# This image is to latest than which one is running online
# FROM klakegg/hugo:ext-alpine
FROM klakegg/hugo@sha256:b66d1bca06dea66dc713a960b290e8df193cb922e09051aecb0fe932e799d652 as hugo_0-88-1

RUN apk add git
