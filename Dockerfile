FROM alpine:3.5
RUN apk add --no-cache --virtual .build-deps ca-certificates curl
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
CMD /configure.sh



##  FROM alpine:3.5
##  
##  ADD configure.sh /configure.sh
##  
##  RUN apk add --no-cache ca-certificates unzip wget \
##   && chmod +x /configure.sh
##  
##  CMD /configure.sh
