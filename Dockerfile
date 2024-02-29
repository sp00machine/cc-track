FROM node:21

# # Define environment variables
ARG JWT_SECRET
ARG PLAID_ENVIRONMENT
ARG PLAID_CLIENT_ID
ARG PLAID_SECRET
ARG DB_HOST
ARG DB_PORT
ARG DB_USER
ARG DB_PASS
ARG DB_NAME
ARG ORIGIN
ARG TZ
ENV JWT_SECRET $JWT_SECRET
ENV PLAID_ENVIRONMENT $PLAID_ENVIRONMENT
ENV PLAID_CLIENT_ID $PLAID_CLIENT_ID
ENV PLAID_SECRET $PLAID_SECRET
ENV DB_HOST $DB_HOST
ENV DB_PORT $DB_PORT
ENV DB_USER $DB_USER
ENV DB_PASS $DB_PASS
ENV DB_NAME $DB_NAME
ENV ORIGIN $ORIGIN
ENV TZ $TZ

# Install node dependencies
RUN npm install -g pnpm
RUN mkdir -p /home/node/app
WORKDIR /home/node/app
COPY ./package.json .
RUN npm install
# COPY ./svelte.config.js .

# Move to container
#COPY . .

# Build for production
#RUN npm run build

# Launch app
EXPOSE 3000
# CMD ["npm", "run", "dev","--", "--port", "3000", "--host"]

