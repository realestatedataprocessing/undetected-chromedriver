FROM alpine:3.14

RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

COPY . /undetected_chromedriver/
WORKDIR /undetected_chromedriver

RUN pip install --upgrade pip
RUN pip install wheel
RUN python setup.py bdist_wheel --universal
#RUN pip install undetected-chromedriver

#RUN find /undetected_chromedriver/
