FROM phusion/passenger-full


RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default

ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf
ADD secret_key.conf /etc/nginx/main.d/secret_key.conf
ADD gzip_max.conf /etc/nginx/conf.d/gzip_max.conf


RUN mkdir /home/app/webapp
RUN bash -lc 'rvm --default use ruby-2.4.5'


WORKDIR /home/app/webapp
ADD ./webapp/ /home/app/webapp/
RUN bundle install


RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init"]


