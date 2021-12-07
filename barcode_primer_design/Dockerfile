FROM continuumio/miniconda3:4.5.12

# get to bioconda
RUN conda config --add channels defaults
RUN conda config --add channels conda-forge
RUN conda config --add channels bioconda

# install packages from bioconda
RUN conda install primer3 blast viennarna

# pip install required packages for bartender/Primerselect software
COPY requirements.txt /barcode_primer_design/
RUN pip install -r /barcode_primer_design/requirements.txt
RUN pip install gunicorn

# now add folders of bartender software
COPY bartender /barcode_primer_design/bartender
COPY databases/*.fa.ndb databases/*.fa.nhr databases/*.fa.nin databases/*.fa.nsq /barcode_primer_design/databases/
COPY primer3_config /barcode_primer_design/primer3_config

# sanity check
RUN bash -c 'ls /barcode_primer_design/databases/{hg38,hg19,mrna,refMrna}.fa.{nhr,nin,nsq,ndb} >/dev/null 2>&1'

# add sofware to pythonpath
ENV PYTHONPATH='$PYTHONPATH:/barcode_primer_design'

EXPOSE 8080

# start bartender service
CMD ["gunicorn", "--worker-class", "eventlet", "-w", "1","--chdir", "barcode_primer_design", "bartender.web_frontend.__main__:app", "--bind", "0.0.0.0:8080"]
