FROM alpine:latest
EXPOSE 1340
WORKDIR /app
RUN apk --no-cache add build-base python3 py3-pip python3-dev
RUN pip3 install wheel
RUN pip3 install flask flask_login flask_sqlalchemy flask_bootstrap werkzeug
COPY flask_app /app
CMD ["python3","app.py"]
