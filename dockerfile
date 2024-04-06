FROM mambaorg/micromamba

WORKDIR /app 
COPY env.yml /app/env.yml

RUN micromamba create -f env.yml 
#RUN micromamba activate my_ml_env

COPY hello.py /app/ 

ENTRYPOINT [ "micromamba","run","-n","my_ml_env","python", "hello.py" ]