FROM alpine:3.7
ADD bin/pingpong /bin/
ENTRYPOINT ["/bin/pingpong"]
