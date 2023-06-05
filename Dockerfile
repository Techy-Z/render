FROM python:3.9-slim-bullseye

COPY . .

RUN apt-get update -y && apt upgrade -y
RUN apt-get install git wget -y

#RUN pip3 install --no-cache-dir -r requirements.txt

CMD ["bash","/start.sh"]
