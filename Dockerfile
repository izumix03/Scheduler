FROM perl:5.26

RUN apt-get update && \
    apt-get install -y sqlite3

RUN cpanm App::Prove::Plugin::PassEnv
RUN cpanm TAP::Formatter::Camelcade

RUN cpanm Carton

WORKDIR /app
COPY . /app

RUN carton install

ENTRYPOINT ["bash"]