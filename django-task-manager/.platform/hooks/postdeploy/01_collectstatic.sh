# This script is executed after the application and web server have been set up in elastic beanstalk and the application version has been deployed. You can use this hook to run any commands that are required after deployment, such as collecting static files, running database migrations, or restarting services.

#!/bin/bash

cd /var/app/current

source /var/app/venv/*/bin/activate


python manage.py collectstatic --noinput
