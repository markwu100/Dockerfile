FROM node:8.9.4 as builder

# Make apt-get update-to-date and install the necessary things.
RUN apt-get update -qq
RUN apt-get install -y build-essential
RUN apt-get install -y git


WORKDIR /usr/app
COPY package.json .
COPY yarn.lock .

RUN yarn install

FROM alpine
COPY --from=builder /usr/app /usr/app

