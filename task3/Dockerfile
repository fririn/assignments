FROM rust:1.88.0-slim-bookworm as builder

RUN apt-get update && \
    apt-get install -y --no-install-recommends git libssl-dev libudev-dev pkg-config zlib1g-dev llvm clang cmake make libprotobuf-dev protobuf-compiler libclang-dev curl && \
    curl -sSfL https://raw.githubusercontent.com/anza-xyz/agave/master/fetch-perf-libs.sh | bash && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src
RUN git clone --depth 1 --branch master https://github.com/anza-xyz/agave.git && cd agave && cargo install --path validator



FROM debian:bookworm-slim
#RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates tar libssl-dev && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/cargo/bin/agave-validator /usr/local/bin/
COPY --from=builder /target/perf-libs/* /usr/local/lib/
EXPOSE 8000-8020 8000-8020/udp 8899-8902 9900

CMD ["agave-validator"]
