FROM node:16-slim as build
WORKDIR /build
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile
COPY . .
RUN yarn run build

FROM nginx
COPY --from=build /build/out /usr/share/nginx/html
