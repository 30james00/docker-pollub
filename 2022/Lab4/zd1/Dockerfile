# syntax=docker/dockerfile:1.2

FROM alpine:3.16 as build

# install ssh client and git
RUN apk add --no-cache openssh-client git
# download public key for github.com
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

WORKDIR /tmp
# clone private repository
RUN --mount=type=ssh git clone git@github.com:30james00/Simpleweb.git

FROM node:lts-alpine3.16

WORKDIR /usr/app
EXPOSE 8080

# install npm packages
COPY --from=build /tmp/Simpleweb/package.json .
RUN npm install

# run app
COPY --from=build /tmp/Simpleweb/index.js .
# Default command
CMD ["npm", "start"]