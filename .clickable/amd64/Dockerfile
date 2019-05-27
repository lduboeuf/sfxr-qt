FROM clickable/ubuntu-sdk:16.04-amd64
RUN echo set debconf/frontend Noninteractive | debconf-communicate && echo set debconf/priority critical | debconf-communicate

RUN apt-get update && apt-get install -y --force-yes --no-install-recommends libsdl1.2-dev python3-yaml python3-jinja2 && apt-get clean