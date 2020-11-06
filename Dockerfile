FROM node:14.4.0-slim
RUN apt-get update && apt-get install -y git\
  && rm -rf /var/lib/apt/lists/*
RUN npm install -g grunt \
  grunt-cli
WORKDIR mqtt-wall
RUN npm install
RUN sed -i 's/localhost:8080/10.0.1.52:9001\/ws/g' ./src/index.html
RUN sed -i 's/\/#/OperationalData\/#/g' ./src/index.html
CMD ["grunt", "serve"]
