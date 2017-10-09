FROM python:3.4

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt
RUN pip install git+https://github.com/data-8/gitautosync
RUN jupyter serverextension enable --py nbgitpuller --sys-prefix
