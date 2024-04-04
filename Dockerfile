FROM python:3.11.9-slim

WORKDIR /app


COPY . /app/

RUN apt-get update && apt-get install -y gcc python3-dev nodejs npm

RUN pip install jupyterlab
RUN jupyter lab build --dev-build=True --minimize=True

EXPOSE 8080

CMD ["jupyter", "lab", "--host", "0.0.0.0", "--port", "8080"]
