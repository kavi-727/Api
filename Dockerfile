# Use the official R base image
FROM r-base:4.3.1

# Install required system libraries
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libgit2-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Plumber from a reliable CRAN mirror
RUN R -e "install.packages('plumber', repos='https://cloud.r-project.org/')"

# Check if Plumber is installed and print the version if successful
RUN R -e "if (!requireNamespace('plumber', quietly=TRUE)) { stop('Plumber installation failed') } else { print('Plumber installed successfully'); print(packageVersion('plumber')) }"

# Set the working directory
WORKDIR /app

# Copy the API script to the container
COPY disease_api.R /app/disease_api.R

# Expose the port the API will run on
EXPOSE 8000

# Run the Plumber API
CMD ["R", "-e", "pr <- plumber::plumb('/app/disease_api.R'); pr$run(host='0.0.0.0', port=8000)"]
