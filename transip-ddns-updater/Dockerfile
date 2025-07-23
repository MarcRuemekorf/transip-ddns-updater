FROM python:3.11-slim

# Install system packages including jq
RUN apt-get update && apt-get install -y \
    jq \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install transip_dns

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]