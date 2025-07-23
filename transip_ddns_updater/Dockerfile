FROM alpine:3.22

ENV LANG C.UTF-8

# Install required packages
RUN apk add --no-cache \
    bash \
    curl \
    jq \
    openssl \
    python3 \
    py3-pip \
    && pip3 install requests

# Copy your script and config
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Set the entrypoint to your script
CMD [ "/run.sh" ]
