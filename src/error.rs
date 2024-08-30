use std::fmt;

#[derive(Debug)]
pub enum SMXError {
    InvalidMode,
    MissingParameters,
    // EncryptionError(String),
    // DecryptionError(String),
}

impl fmt::Display for SMXError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            SMXError::InvalidMode => write!(f, "Invalid encryption/decryption mode"),
            SMXError::MissingParameters => write!(f, "Missing parameters"),
            // SMXError::EncryptionError(err) => write!(f, "Encryption error: {}", err),
            // SMXError::DecryptionError(err) => write!(f, "Decryption error: {}", err),
        }
    }
}

impl std::error::Error for SMXError {}
