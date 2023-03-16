FROM rust:1.68 as build
WORKDIR /app
COPY . .
RUN cargo fetch
RUN cargo build --release

FROM ubuntu
WORKDIR /
COPY --from=build /app/target/release/zero2prod /zero2prod
CMD ["/zero2prod"]
