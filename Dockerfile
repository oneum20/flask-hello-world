FROM python:3-alpine
ENV USER=app
ENV PORT=8888

RUN addgroup "$USER" && \
    adduser --disabled-password --ingroup $USER  "$USER"

USER app
WORKDIR /home/app

COPY app.py .
COPY requirements.txt .

RUN pip install -r requirements.txt --user "$USER"

EXPOSE $PORT

ENTRYPOINT ["python", "app.py"]



