import sys
import os

PROJECT_PATH = "/mnt/home7/nelisaao/farmacia"
VENV_PYTHON = "/mnt/home7/nelisaao/virtualenv/nelisa_farmacia_app/3.12/bin/python"

sys.path.insert(0, PROJECT_PATH)

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "admin.settings")
os.environ["PYTHONPATH"] = PROJECT_PATH

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
