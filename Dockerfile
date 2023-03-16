FROM rust:1.68-buster as build
WORKDIR /app
COPY . .
RUN cargo install --path .

FROM debian:buster-slim
WORKDIR /
COPY --from=build /usr/local/cargo/bin/fibonacci-rust /usr/local/bin/fibonacci-rust
CMD ["fibonacci-rust"]
