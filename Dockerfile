## Build
FROM beevelop/ionic AS ionic
# Create app directory
WORKDIR /usr/src/app
# Install app dependencies
COPY package*.json ./
RUN npm ci
# Bundle app source
COPY . .
RUN ionic build --prod

## Run 
FROM nginx:alpine
#COPY www /usr/share/nginx/html
COPY --from=ionic  /usr/src/app/www /usr/share/nginx/html

# # Use NodeJS base image
# FROM node:11

# # Install app dependencies by copying
# # package.json and package-lock.json
# COPY package*.json ./

# # Copy app source
# COPY . /www

# # Install dependencies
# RUN npm install -g cordova  ionic
# RUN npm install -g bower
# RUN npm install -g gulp

# # Create app directory
# WORKDIR /www
# RUN npm install


# # Bind the port that the image will run on
# EXPOSE 8100

# # Define the Docker image's behavior at runtime
# # CMD ["node", "server.js"]
# ENTRYPOINT ["ionic"]
# CMD ["serve", "8100", "--address", "0.0.0.0"]