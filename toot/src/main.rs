extern crate elefren;

use std::env;
use std::io;
use std::path::Path;
use std::error::Error;

use elefren::prelude::*;
use elefren::helpers::toml; // requires `features = ["toml"]`

fn main() -> Result<(), Box<dyn Error>> {
    let config_filename = if Path::new("mastodon-data.toml").exists() {
        "mastodon-data.toml"
    } else {
        "~/.mastodon-data.toml"
    };
    let mastodon = if let Ok(data) = toml::from_file(config_filename) {
        Mastodon::from(data)
    } else {
        register()?
    };

    let args: Vec<String> = env::args().collect();
    let status_text = args.get(1);
    match status_text {
        Some(text) => {
            let status = StatusBuilder::new()
                .status(text)
                .sensitive(false)
                .build()?;
            mastodon.new_status(status)?;
        },
        None => println!("No text to toot"),
    }

    Ok(())
}

fn register() -> Result<Mastodon, Box<dyn Error>> {
    let registration = Registration::new("https://chaos.social")
        .client_name("toot-cli")
        .scopes(Scopes::read_all() | Scopes::write_all()) // write:statuses would be sufficient. Scopes::Write didn't work
        .build()?;
    let url = registration.authorize_url()?;

    println!("Click this link to authorize on Mastodon: {}", url);
    println!("Paste the returned authorization code: ");

    let mut input = String::new();
    io::stdin().read_line(&mut input)?;

    let code = input.trim().to_string();
    let mastodon = registration.complete(&code)?;

    // Save app data for using on the next run.
    toml::to_file(&*mastodon, "mastodon-data.toml")?;

    Ok(mastodon)
}
