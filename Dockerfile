FROM node:lts-alpine@sha256:32f64135e74ec4dc5d63cc36318444f1d801cd23c44253124f7eccb52c4b89c5

ENV NODE_ENV production
WORKDIR /usr/src/app


COPY --chown=node:node app/package*.json app/app.js ./

RUN npm install 

# for production
# RUN npm ci --only=production


EXPOSE 3000

CMD ["node","app.js"]