FROM phusion/passenger-full


RUN rm -f /etc/service/nginx/down



RUN rm /etc/nginx/sites-enabled/default

ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf
ADD secret_key.conf /etc/nginx/main.d/secret_key.conf
ADD gzip_max.conf /etc/nginx/conf.d/gzip_max.conf

CMD ["/sbin/my_init"]


RUN mkdir /home/app/webapp
#COPY --chown=app:app /local/path/of/your/app /home/app/webapp 

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


