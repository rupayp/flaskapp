FROM python:3.7-slim-buster

RUN pip install virtualenv
ENV INSTALL_PATH /osr
ENV VIRTUAL_ENV=/venv
RUN virtualenv venv -p python3
ENV PATH="VIRTUAL_ENV/bin:$PATH"


# added this line
WORKDIR $INSTALL_PATH

COPY . .

RUN pip install -r requirements.txt

# Expose port
EXPOSE 5000

# Run the application:
CMD ["python", "rest_server.py"]