# Pull base image
FROM node

LABEL "react-beta"="1.0"

# Set environment varibles
ENV PRD 1

COPY ./src /src

# Set work directory
WORKDIR /src

EXPOSE 8080

# Install dependencies
RUN npm install

CMD [ "npm", "start" ]