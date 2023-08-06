# Build the rust binary
FROM docker.io/rust:1-bullseye as builder
# Set workling directory and copy the source code
WORKDIR /usr/src/app
COPY . .
# Build release binary
RUN cargo build --release



# Buind distroless image
FROM gcr.io/distroless/cc-debian11 as runner
# Copy built binary from builder
COPY --from=builder /usr/src/app/target/release/rust-web-api /
# Expose default port
EXPOSE 7878
# Start the binary
ENTRYPOINT [ "/rust-web-api" ]