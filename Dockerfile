FROM alpine

RUN set -x && \
    apk add --update --no-cache \
    perl

# Grab flamegraph
RUN	wget -O /usr/local/bin/flamegraph.pl https://raw.githubusercontent.com/brendangregg/FlameGraph/master/flamegraph.pl \
	&& chmod +x /usr/local/bin/flamegraph.pl


ENTRYPOINT ["/usr/local/bin/flamegraph.pl"]
CMD ["--help"]