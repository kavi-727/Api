# Base image for R
FROM rstudio/plumber:latest

# Set environment variables
ENV PORT=8000

# Copy the API script to the container
COPY api.R /app/api.R

# Set the working directory
WORKDIR /app

# Install necessary R packages
RUN R -e "install.packages('plumber')"

# Expose the port
EXPOSE $PORT

# Command to run the API
CMD ["R", "-e", "pr <- plumber::plumb('api.R'); pr$run(host='0.0.0.0', port=as.numeric(Sys.getenv('PORT')))" ]
