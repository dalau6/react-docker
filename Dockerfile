# build environment
FROM node as react-node

LABEL "react-beta"="1.0"

# Set environment varibles
ENV PRD 1

COPY ./src /src

# Set work directory
WORKDIR /src

# add `/src/node_modules/.bin` to $PATH
ENV PATH /src/node_modules/.bin:$PATH

# EXPOSE 8080

# Install dependencies
RUN npm install

RUN npm run build

# production environment
FROM nginx:1.17.6-alpine

COPY --from=react-node /src/dist /usr/share/nginx/html

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx/nginx.conf /etc/nginx/conf.d

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]