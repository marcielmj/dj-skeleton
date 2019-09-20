FROM python:3.6.9-alpine3.9

WORKDIR /usr/src/app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY Pipfile* ./

RUN apk update \
    && apk add --no-cache --virtual .build-deps \
        gcc \
        musl-dev \
        python3-dev \
        postgresql-dev \
    && pip install --no-cache-dir pipenv \
    && pipenv install --deploy --system \
    && apk del .build-deps \
    && apk add --no-cache libpq

COPY . .

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]
