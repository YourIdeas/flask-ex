FROM centos/python-36-centos7

EXPOSE 8080

USER 1001

RUN pip install --upgrade pip
RUN pip install flask_swagger_ui
RUN pip install flasgger

# Install pip requirements
ADD requirements.txt /opt/app-root/src/requirements.txt

RUN pip install -r requirements.txt

CMD ["gunicorn", "-b", "0.0.0.0:8080", "wsgi:application"]
