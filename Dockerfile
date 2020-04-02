FROM alpine:3

RUN apk add --no-cache clamav rsyslog wget clamav-libunrar

COPY ./scan.sh /
RUN chmod +x /scan.sh

ENTRYPOINT [ "/scan.sh" ]