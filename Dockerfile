FROM ubuntu:14.04
RUN apt-get update \
	&& apt-get install --no-install-recommends python-pip build-essential python-dev -y


RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app/
RUN pip install -r requirements.txt

COPY . /usr/src/app

CMD [ "gunicorn", "-b", "0.0.0.0:80", "server:app" ]