use std::net::SocketAddr;

use axum::{routing::get, Router, Server};

#[tokio::main]
async fn main() {
    let router = Router::new().route("/", get(|| async { "hello 👋" }));

    let address = SocketAddr::from(([127, 0, 0, 1], 7878));
    println!("Listening on {}", address);

    Server::bind(&address)
        .serve(router.into_make_service())
        .await
        .unwrap();
}
