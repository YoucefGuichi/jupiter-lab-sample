FROM python:3.11.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y curl && curl -fsSL https://deb.nodesource.com/setup_20.x | sh 
RUN apt-get install -y  nodejs

COPY . /app/

RUN pip install jupyterlab
RUN jupyter lab build --dev-build=True --minimize=True

EXPOSE 8080


CMD ["jupyter", "lab", "--port", "8080", "--allow-root"]
