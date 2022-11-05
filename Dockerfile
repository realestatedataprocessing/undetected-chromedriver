
FROM alpine:3.14


RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

COPY . /undetected_chromedriver/
RUN python /undetected_chromedriver/setup.py bdist


