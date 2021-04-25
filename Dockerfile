# Use NodeJS base image
FROM node:11

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

# Copy app source
COPY . /www

# Install dependencies
RUN npm install -g cordova  ionic
RUN npm install -g bower
RUN npm install -g gulp

# Create app directory
WORKDIR /www
RUN npm install


# Bind the port that the image will run on
EXPOSE 8100

# Define the Docker image's behavior at runtime
# CMD ["node", "server.js"]
ENTRYPOINT ["ionic"]
CMD ["serve", "8100", "--address", "0.0.0.0"]