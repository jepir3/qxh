FROM debian:buster-slim
RUN apt-get update && apt-get -y install wget xz-utils git && \
    cd /opt && git clone https://github.com/jepir3/upgraded-couscous && \
	apt-get -y purge xz-utils && apt-get -y autoremove --purge && apt-get -y clean && apt-get -y autoclean; rm -rf /var/lib/apt-get/lists/*
COPY entrypoint /opt/tuske
RUN chmod +x /opt/tuske/entrypoint && ls
# it needs a workdir spec in order to see the 'verus-solver' binary right next to it
WORKDIR "/opt/tuske"
ENTRYPOINT "./entrypoint"
# EOF
