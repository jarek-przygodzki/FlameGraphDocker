FROM alpine

# Install perl and grab flamegraph
RUN set -x && \
	apk add --update --no-cache perl && \
	wget -O FlameGraph.zip https://github.com/brendangregg/FlameGraph/archive/master.zip && \
	unzip -j FlameGraph.zip 'FlameGraph-master/*.pl' -d /usr/local/bin && \
	rm -f FlameGraph.zip && \
	chmod +x /usr/local/bin/*.pl


ENTRYPOINT ["/usr/local/bin/flamegraph.pl"]
CMD ["--help"]