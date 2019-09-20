import os
import dj_database_url

from .base import *


SECRET_KEY = os.environ.get("SECRET_KEY", "{{ secret_key }}")

DEBUG = True

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.sqlite3",
        "NAME": os.path.join(BASE_DIR, "db.sqlite3"),
    }
}

DATABASES["default"].update(
    dj_database_url.config(conn_max_age=500, ssl_require=False)
)
