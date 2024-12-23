# Use the official R base image
FROM r-base:4.3.1

# Install required system libraries
RUN apt-get update && apt-get install -y \
    build-essential \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libgit2-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Plumber and dependencies
RUN R -e "install.packages('plumber', repos='http://cran.rstudio.com/', dependencies=TRUE)"

# Verify Plumber installation
RUN R -e "if (!requireNamespace('plumber', quietly=TRUE)) { stop('Plumber not installed') }"

# Set the working directory
WORKDIR /app

# Copy the API script to the container
COPY disease_api.R /app/disease_api.R

# Expose the port the API will run on
EXPOSE 8000

# Run the Plumber API
CMD ["R", "-e", "pr <- plumber::plumb('/app/disease_api.R'); pr$run(host='0.0.0.0', port=8000)"]
