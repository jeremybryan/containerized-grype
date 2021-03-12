FROM alpine:latest

RUN apk --no-cache add curl

RUN curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/local/bin

ENTRYPOINT [ "/usr/local/bin/grype" ]
