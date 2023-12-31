# Stage 1: Build the application
FROM node:18-alpine AS build

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install 

COPY . .

# Stage 2: Create the final image
FROM build

WORKDIR /app

COPY --from=build /app .

CMD ["node", "index.js"]
