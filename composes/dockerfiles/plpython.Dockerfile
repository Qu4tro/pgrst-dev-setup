FROM postgres:11

# Install system dependencies:
RUN apt-get update && apt-get install -y git
RUN apt-get update && apt-get install -y python3 python3-virtualenv
RUN apt-get update && apt-get install -y postgresql-plpython3-11

# Activate virtualenv here

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m virtualenv --python=/usr/bin/python3 $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install application dependencies:
COPY data/requirements.txt .
RUN pip install -r requirements.txt
