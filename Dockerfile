FROM python:3.4

# Set up non-root user
ENV NB_USER jovyan
ENV NB_UID 1000
ENV NB_GID 1000
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
     ${NB_USER}
    
# Move over things like requirements.txt we'll use later on..
COPY . .

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt
RUN pip install git+https://github.com/data-8/gitautosync
RUN jupyter serverextension enable --py nbgitpuller --sys-prefix
