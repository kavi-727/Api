# Base image for R
FROM rstudio/plumber

# Install system dependencies
RUN apt-get update -qq && \
    apt-get install -y \
    libssl-dev \
    libcurl4-gnutls-dev \
    unixodbc-dev \
    libmysqlclient-dev

# Create the /app directory
RUN mkdir /app

# Copy the R script (disease_api.R) into the container
COPY disease_api.R /app/

# Set the working directory to /app
WORKDIR /app

# Expose the port for the Plumber API
EXPOSE 8000

# Install necessary R packages
RUN R -e "install.packages(c('plumber', 'dplyr'), dependencies = TRUE)"

# Command to run the Plumber API
CMD ["R", "-e", "pr <- plumber::plumb('/app/disease_api.R'); pr$run(host='0.0.0.0', port=8000, swagger = TRUE)"]
