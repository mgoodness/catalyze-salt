postgresql-package:
  pkg.installed:
    - name: postgresql

postgresql-dev:
  pkg.installed:
    - name: postgresql-server-dev-all

catalyze_dev_user:
  postgres_user.present:
    - name: 'catalyze_dev'
    - password: 'catalyze_dev'
    - require:
      - pkg: postgresql-package
      - pkg: postgresql-dev

catalyze_prod_user:
  postgres_user.present:
    - name: 'catalyze-prod'
    - password: 'catalyze-prod'
    - require:
      - pkg: postgresql-package
      - pkg: postgresql-dev

catalyze_dev_database:
  postgres_database.present:
    - name: 'catalyze_dev'
    - owner: 'catalyze_dev'
    - require:
      - postgres_user: catalyze_dev_user

catalyze_prod_database:
  postgres_database.present:
    - name: 'catalyze-prod'
    - owner: 'catalyze-prod'
    - require:
      - postgres_user: catalyze_prod_user
