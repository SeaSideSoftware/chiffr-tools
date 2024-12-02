import XCTest
@testable import ChiffrTools
import CryptoKit
import UIKit

final class ChiffrToolsTests: XCTestCase {

    // MARK: - Test: Secure Random Data
    func testSecureRandomData() {
        let randomData = Data.secureRandomData(length: 16)
        XCTAssertEqual(randomData.count, 16, "Generated data length should match the requested length.")
        
        let uniqueData = Set(randomData)
        XCTAssertGreaterThan(uniqueData.count, 1, "Random data should not be all the same byte.")
    }

    // MARK: - Test: Image Hash
    func testImageHash() {
        guard let image = UIImage(systemName: "circle") else {
            XCTFail("Failed to load system image for testing.")
            return
        }
        
        let hash = imageHash(image: image)
        XCTAssertNotNil(hash, "Image hash should not be nil.")
        XCTAssertEqual(hash?.count, 32, "SHA256 hash should produce a 32-byte array.")
    }

    // MARK: - Test: Hexadecimal Hash
    func testHexadecimalHash() {
        let cipher = Data.secureRandomData(length: 32)
        let hexHash = hexadecimalHash(cipher: cipher)
        
        XCTAssertEqual(hexHash.count, 64, "Hexadecimal hash of a SHA256 digest should be 64 characters long.")
        XCTAssertTrue(hexHash.allSatisfy { $0.isHexDigit }, "Hexadecimal hash should contain only valid hex characters.")
    }

    // MARK: - Test: Convert to SIMD8
    func testConvertToSIMD8() {
        let input = Data.secureRandomData(length: 32)
        let simdResult = convertToSIMD8(from: input)
        
        XCTAssertEqual(simdResult.scalarCount , 8, "SIMD8 vector should have 8 elements.")
    }

    // MARK: - Test: Generate ChaCha Seeded Data
    func testGenerateManyChaChaSeeded() {
        let seed = Data.secureRandomData(length: 32)
        let generatedData = generateManyChaChaSeeded(mySeed: seed, length: 16)
        
        XCTAssertEqual(generatedData.count, 16, "Generated data length should match the requested length.")
    }

    // MARK: - Test: XOR Encryption and Decryption
    func testXOREncryptDecrypt() {
        let messageBytes = Data.secureRandomData(length: 16)
        let cipherBytes = Data.secureRandomData(length: 16)
        
        let encryptedBytes = xorEncrypt(messageBytes: messageBytes, cipherBytes: Data(cipherBytes))
        XCTAssertEqual(encryptedBytes.count, 16, "Encrypted data length should match the input length.")
        
        let decryptedBytes = xorDecrypt(xoredBytes: encryptedBytes, cipherBytes: Data(cipherBytes))
        XCTAssertEqual(decryptedBytes, messageBytes, "Decrypted bytes should match the original message bytes.")
    }

    // MARK: - Test: XOR Encryption with Mismatched Lengths
    func testXOREncryptionMismatchedLengths() {
        let messageBytes = Data.secureRandomData(length: 16)
        let cipherBytes = Data.secureRandomData(length: 8)
        
        let encryptedBytes = xorEncrypt(messageBytes: messageBytes, cipherBytes: Data(cipherBytes))
        XCTAssertEqual(encryptedBytes.count, 0, "Encryption should return an empty array when lengths are mismatched.")
    }

    // MARK: - Test: XOR Decryption with Mismatched Lengths
    func testXORDecryptionMismatchedLengths() {
        let xoredBytes = Data.secureRandomData(length: 16)
        let cipherBytes = Data.secureRandomData(length: 8)
        
        let decryptedBytes = xorDecrypt(xoredBytes: xoredBytes, cipherBytes: Data(cipherBytes))
        XCTAssertEqual(decryptedBytes.count, 0, "Decryption should return an empty array when lengths are mismatched.")
    }
}

