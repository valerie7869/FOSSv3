FROM ubuntu:14.04

# https://github.com/valerie7869

# add the fossology repo
RUN echo "deb http://www.fossology.org/releases/3.0.0/Ubuntu/ 14.04 contrib" >> /etc/apt/sources.list

# update existing packages
RUN apt-get update

# install postgresql database
RUN apt-get install -y postgresql

# install fossology from a script, due to the postgresql dependency
ADD scripts/install_fossology.sh /usr/bin/install_fossology.sh
RUN install_fossology.sh

# the entrypoint script
ADD scripts/start_fossology.sh /usr/bin/start_fossology.sh

# apache is configured for port 80
EXPOSE 80

# let's go!
ENTRYPOINT ["/usr/bin/start_fossology.sh"]