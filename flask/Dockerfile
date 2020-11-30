FROM python:3.6

RUN mkdir flask

WORKDIR flask

RUN mkdir modelsData

COPY . .

RUN pip install -r requirements.txt

RUN export PROJECT_HOME=/flask/modelsData

RUN ls -a modelsData

CMD python web/predict_flask.py
