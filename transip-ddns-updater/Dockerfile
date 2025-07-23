FROM python:3.11-slim

RUN pip install transip_dns

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]