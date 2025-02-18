FROM alpine:3.17

RUN apk add --update --no-cache bash xvfb
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python

RUN python3 -m venv /undetected_chromedriver
RUN chmod +x /undetected_chromedriver/bin/activate
RUN /undetected_chromedriver/bin/activate
RUN python3 -m ensurepip --upgrade


RUN pip3 install --no-cache --upgrade pip setuptools

#RUN pip install --upgrade pip
RUN pip3 install wheel

COPY . /undetected_chromedriver/
WORKDIR /undetected_chromedriver

#RUN python setup.py bdist_wheel --universal
RUN chmod +x /undetected_chromedriver/entrypoint.sh
RUN pip3 install -r /undetected_chromedriver/requirements.txt

#ENTRYPOINT ["/undetected_chromedriver/entrypoint.sh"]
CMD ["python", "/undetected_chromedriver/demo.py"]