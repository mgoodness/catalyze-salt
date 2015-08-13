nginx-package:
  pkg.installed:
    - name: nginx

nginx-service:
  service.running:
    - name: nginx
    - enable: True
    - watch:
      - pkg: nginx
      - file: /etc/nginx/sites-available/default

nginx-config:
  file.managed:
    - name: /etc/nginx/sites-available/default
    - source: salt://files/nginx-default.conf
    - owner: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: nginx-package
