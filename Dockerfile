# Stage 1: Build React application
FROM node:14 as builder

WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the React application
RUN npm run build

# Stage 2: Create a lightweight image for runtime
FROM nginx:alpine

# Copy the build output from the builder stage to the nginx public directory
COPY --from=builder /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# The default command to start nginx
CMD ["nginx", "-g", "daemon off;"]
