#!/bin/bash

/usr/bin/python manage.py migrate
/usr/bin/python manage.py runserver {{ pillar['bind_address'] }}:8080
