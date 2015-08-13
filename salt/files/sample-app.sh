#!/bin/bash

/usr/bin/python manage.py migrate
/usr/bin/python manage.py runserver 127.0.0.1:8080
