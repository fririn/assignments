FROM rust:1.88.0-slim-bookworm as builder

RUN apt-get update && \
    apt-get install -y --no-install-recommends git libssl-dev libudev-dev pkg-config zlib1g-dev llvm clang cmake make libprotobuf-dev protobuf-compiler libclang-dev curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src
RUN git clone --depth 1 --branch master https://github.com/anza-xyz/agave.git && cd agave && \
    cargo install --path validator && \
    ./fetch-perf-libs.sh



FROM debian:bookworm-slim
COPY --from=builder /usr/local/cargo/bin/agave-validator /usr/local/bin/
COPY --from=builder /usr/src/agave/target/perf-libs /usr/local/lib/

EXPOSE 8000-8020 8000-8020/udp 8899-8902 9900
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

ENTRYPOINT ["agave-validator"]
CMD ["--help"]
