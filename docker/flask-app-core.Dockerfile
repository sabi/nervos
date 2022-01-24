FROM alpine:latest
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
EXPOSE 80
WORKDIR /app
COPY app /app
RUN pip3 install -r requirements.txt
CMD ["python3","app.py"]
