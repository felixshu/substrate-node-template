FROM paritytech/ci-linux:d1e1f5a8-20210219 as builder

WORKDIR /substrate
COPY . /substrate

RUN ./scripts/init.sh

RUN cargo build --release

FROM paritytech/ci-linux:production

COPY --from=builder /substrate/target/release/substrate /usr/local/bin


EXPOSE 30333 9933 9944
VOLUME ["/data"]
ENTRYPOINT ["/usr/local/bin/powerchain"]
