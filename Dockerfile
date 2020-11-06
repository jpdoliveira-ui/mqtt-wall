FROM node:14.4.0-slim
RUN apt-get update && apt-get install -y git\
  && rm -rf /var/lib/apt/lists/*
RUN npm install -g grunt \
  grunt-cli
RUN git clone https://github.com/jpdoliveira-ui/mqtt-wall.git
WORKDIR mqtt-wall
RUN npm install
RUN sed -i 's/\/#/OperationalData\/#/g' ./src/index.html
CMD ["grunt", "serve"]
