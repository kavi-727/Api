# Base image for R
FROM rstudio/plumber:latest

# Set environment variables
ENV PORT=8000

# Copy the API script to the container
COPY disease_api /app/disease_api

# Set the working directory
WORKDIR /app

# Install necessary R packages
RUN R -e "install.packages('plumber')"

# Expose the port
EXPOSE $PORT

# Command to run the API
CMD ["R", "-e", "pr <- plumber::plumb('disease_api'); pr$run(host='0.0.0.0', port=as.numeric(Sys.getenv('PORT')))" ]
