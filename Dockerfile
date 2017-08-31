FROM python:2.7-alpine

RUN apk add --update alpine-sdk libffi-dev openssl-dev openssl \
    && pip install elastalert

WORKDIR /app/elastalert

# One can also mount a git volume, so as to have any
# commit in config file trigger a reload of elastalert
VOLUME ["/app/elastalert"]

# Arguments need to be specified in k8s when intiating this service
ENTRYPOINT ["elastalert", "--config", "config/config.yaml"]
