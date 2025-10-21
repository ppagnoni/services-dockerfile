FROM node:18-alpine3.17

WORKDIR /usr/app

COPY package*.json /usr/app/

RUN npm install

COPY . .

# these var are replaced in k8s when we configure the pod with this image!
ENV MONGO_URI=uriPlaceholder
ENV MONGO_USERNAME=usernamePlaceholder
ENV MONGO_PASSWORD=passwordPlaceholder

EXPOSE 3000

CMD [ "npm", "start" ]