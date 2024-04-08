FROM mambaorg/micromamba:latest

WORKDIR /app 
COPY env.yml /app/env.yml

# Создание и активация окружения для разработки машинного обучения
RUN micromamba install -y -f env.yml && \
    micromamba clean --all --yes

COPY . /app/

# Установка точки входа для запуска приложения в созданном окружении
ENTRYPOINT [ "micromamba", "run", "-n", "fast_dev_ml_env", "--no-capture-output", "python", "/app/hello.py" ]
