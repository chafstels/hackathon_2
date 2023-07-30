FROM python:3.11-alpine3.18

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

EXPOSE 8000

COPY requirements.txt /temp/requirements.txt

RUN apk add postgresql-client build-base postgresql-dev

RUN pip install -r /temp/requirements.txt

RUN adduser --disabled-password shop_books && chmod 777 /opt /run

COPY shop_books /shop_books
WORKDIR /shop_books


RUN mkdir /shop_books/static && mkdir /shop_books/media && chown -R shop_books:shop_books /shop_books && chmod 755 /shop_books


USER shop_books


CMD ["gunicorn","-b","0.0.0.0:8001","shopAPI.wsgi:application"]
