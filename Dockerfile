# Use an official lightweight Node.js image
FROM node:18-alpine

# Set environment variables in key=value format
# ENV NODE_ENV=production

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) before other files
# This allows Docker to cache the installation step if no changes are made to dependencies
COPY package*.json ./

# Install dependencies
# RUN npm install
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Ensure all Next.js dependencies are installed (like next, react, react-dom)
# Run a pre-build check to verify if Next.js is installed correctly
RUN npm install next react react-dom

# Build the Next.js application
RUN npm run build

# Expose the port on which the app will run
EXPOSE 3000

# Start the Next.js app
CMD ["npm", "start"]
