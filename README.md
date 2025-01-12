# ChiffrTools

ChiffrTools is a Swift package that provides utilities for cryptographic operations, random data generation, and lightweight encryption/decryption using XOR and CryptoKits's AES. This package supports the Chiffr messaging app on iOS.

## Features

- Generate secure random data.
- Compute SHA256 hashes for images and arbitrary data.
- Convert SHA256 hash data into a hexadecimal string.
- Generate seeded random bytes using the ChaCha algorithm.
- Lightweight XOR encryption and decryption.

# Documentation

## Functions

- **`Data.secureRandomData(length: Int) -> [UInt8]`**  
  Generates a specified number of secure random bytes.

- **`imageHash(image: UIImage) -> [UInt8]?`**  
  Computes a SHA256 hash of the given image.

- **`hexadecimalHash(cipher: [UInt8]) -> String`**  
  Converts the SHA256 hash of the input bytes into a hexadecimal string.

- **`generateManyChaChaSeeded(mySeed: [UInt8], length: Int) -> [UInt8]`**  
  Generates random bytes using a ChaCha8 RNG seeded with a SIMD8 vector.

- **`convertToSIMD8(from array: [UInt8]) -> SIMD8<UInt32>`**  
  Converts a 32-byte array into a SIMD8 vector of UInt32 values.

- **`xorEncrypt(messageBytes: [UInt8], cipherBytes: Data) -> [UInt8]`**  
  Encrypts data using XOR.

- **`xorDecrypt(xoredBytes: [UInt8], cipherbytes: Data) -> [UInt8]`**  
  Decrypts XOR-encrypted data.

- **`encryptAES(message: String, using key: SymmetricKey) throws -> [UInt8] `**  
  Encrypts a String with AES using a given SymmetricKey.
  
- **`decryptAES(encryptedData: Data, using key: SymmetricKey) throws -> Data`**  
  Decrypts Data with AES using a given SymmetricKey.

- **`generateSymmetricKey(keyData: Data) -> SymmetricKey`**  
  Generates a SymmetricKey to use for AES encryption and decryption.
  
---

## Tests

Comprehensive tests are included in the `ChiffrToolsTests` module. To run the tests:

1. Open the project in Xcode.  
2. Press **Command + U** to run the test suite.
 
___

## License

ChiffrTools is licensed under the MIT License. See the `LICENSE` file for details.

---

## Acknowledgments

- Swift Forums for inspiring the secure random data generator.  
- ChaChaRNG for the ChaCha RNG implementation.  
- Stack Overflow for conversion logic from UInt8 to UInt32.

