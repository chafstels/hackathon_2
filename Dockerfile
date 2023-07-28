FROM python:3.11-alpine3.18

COPY requirements.txt /temp/requirements.txt

RUN apk add postgresql-client build-base postgresql-dev

RUN pip install -r /temp/requirements.txt

RUN adduser --disabled-password service-user

COPY shop_books /shop_books
WORKDIR /shop_books
EXPOSE 8000



USER service-user