FROM fpco/stack-build

RUN apt-get update && apt-get install entr && rm -rf /var/lib/apt/lists/* 

ARG HOST_UID
ARG HOST_GID

RUN groupadd -g ${HOST_GID} pgrst-user &&\
    useradd -l -u ${HOST_UID} -g pgrst-user pgrst-user &&\
    install -d -m 0755 -o pgrst-user -g pgrst-user /home/pgrst-user

RUN adduser pgrst-user sudo && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY postgrest/stack.yaml /home/pgrst-user/postgrest/stack.yaml
COPY postgrest/postgrest.cabal /home/pgrst-user/postgrest/postgrest.cabal

COPY postgrest.conf /etc/postgrest.conf
RUN mkdir -p /home/pgrst-user/postgrest/.stack-work /home/pgrst-user/.stack
RUN chown pgrst-user:pgrst-user /home/pgrst-user/postgrest /home/pgrst-user/postgrest/.stack-work /home/pgrst-user/.stack /etc/postgrest.conf 

USER pgrst-user

WORKDIR /home/pgrst-user/postgrest
RUN stack build --only-dependencies

COPY postgrest/src /home/pgrst-user/postgrest/src
COPY postgrest/main /home/pgrst-user/postgrest/main
RUN sudo chown -R pgrst-user:pgrst-user .
RUN stack build

COPY postgrest /home/pgrst-user/postgrest
RUN sudo chown -R pgrst-user:pgrst-user .
ENTRYPOINT ["/bin/sh", "-c", "find \"$(stack path --dist-dir)/stack-build-caches\" /etc/postgrest.conf | grep postgrest | entr -r -- stack run /etc/postgrest.conf"]
