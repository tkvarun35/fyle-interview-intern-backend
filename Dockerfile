FROM python:3.8-alpine

ARG USER

RUN apk --no-cache update && \
    apk add --no-cache gcc git python3-dev musl-dev libffi-dev openssl-dev build-base

ENV PYTHONUNBUFFERED 1
WORKDIR /fyle_backend

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

RUN adduser -D $USER && \
    chown -R $USER:$USER /fyle_backend && \
    chmod -R 755 /fyle_backend

USER $USER