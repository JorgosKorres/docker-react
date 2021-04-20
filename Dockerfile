# Build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Second phase
FROM nginx
# COPY build folder into
# from a different phase (builder phase) in folder
COPY --from=builder /app/build /usr/share/nginx/html
