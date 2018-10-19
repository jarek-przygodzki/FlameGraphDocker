FROM alpine

RUN set -x && \
    apk add --update --no-cache \
    perl

# Grab flamegraph
RUN	wget -O FlameGraph.zip https://github.com/brendangregg/FlameGraph/archive/master.zip && \
	unzip -j FlameGraph.zip 'FlameGraph-master/*.pl' -d /usr/local/bin && \
	rm -f FlameGraph.zip && \
	chmod +x /usr/local/bin/*.pl


ENTRYPOINT ["/usr/local/bin/flamegraph.pl"]
CMD ["--help"]