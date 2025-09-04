FROM python:2.7.17-alpine

RUN apk update; apk add make
RUN mkdir /app
WORKDIR /app
COPY ./src /app/

RUN pip install -r backend/requirements.txt
RUN pip install -r backend/requirements.txt --upgrade
#RUN make init

COPY src/whoknows.db /tmp/whoknows.db

EXPOSE 8080 8080

ENTRYPOINT [ "make", "run" ]