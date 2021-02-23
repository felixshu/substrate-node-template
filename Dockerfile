FROM felixgrayson/chaintools:1.0.1 as builder

WORKDIR /substrate
COPY . /substrate

RUN rustup toolchain install nightly;rustup target add wasm32-unknown-unknown --toolchain nightly

RUN cargo build --release

FROM paritytech/ci-linux:production

COPY --from=builder /substrate/target/release/substrate /usr/local/bin


EXPOSE 30333 9933 9944
VOLUME ["/data"]
ENTRYPOINT ["/usr/local/bin/powerchain"]
