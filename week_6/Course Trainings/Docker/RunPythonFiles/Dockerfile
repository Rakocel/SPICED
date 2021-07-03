FROM python:3.6

WORKDIR /app

ADD src/. /app

COPY requirements.txt /app

RUN pip install --trusted-host pypi.python.org -r requirements.txt

CMD ["python", "data_exploration.py"]
