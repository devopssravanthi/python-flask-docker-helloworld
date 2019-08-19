FROM python:3.6-slim
COPY . /src/flask_app
WORKDIR /src/flask_app
RUN apt-get clean \
    && apt-get -y update
RUN apt-get -y install nginx \
    && apt-get -y install python3-dev \
    && apt-get -y install build-essential
RUN pip install -r requirements.txt --src /usr/local/src
COPY resources/nginx.conf /etc/nginx
RUN chmod +x ./start.sh
CMD ["./start.sh"]