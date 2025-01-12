import CryptoKit
import Foundation
import os

/// Generates a symmetric key from Data.
public func generateSymmetricKey(keyData: Data) -> SymmetricKey {
    os_log("Generating symmetric key with provided data of length: %d", keyData.count)
    let key = SymmetricKey(data: keyData)
    os_log("Symmetric key successfully generated")
    return key
}

/// Encrypts a provided String message using a Symmetric Key, returns [UInt8]
public func encryptAES(message: String, using key: SymmetricKey) throws -> [UInt8] {
    os_log("Starting encryption for message of length: %d", message.utf8.count)
    let messageData = Data(message.utf8)
    let sealedBox = try AES.GCM.seal(messageData, using: key)
    os_log("Encryption successful. Length of encrypted data: %d", sealedBox.combined?.count ?? 0)
    return [UInt8](sealedBox.combined!)
}

/// Decrypts Data using a Symmetric Key, returns Data
public func decryptAES(encryptedData: Data, using key: SymmetricKey) throws -> Data {
    os_log("Starting decryption for encrypted data of length: %d", encryptedData.count)
    let sealedBox = try AES.GCM.SealedBox(combined: encryptedData)
    let decryptedData = try AES.GCM.open(sealedBox, using: key)
    os_log("Decryption successful. Length of decrypted data: %d", decryptedData.count)
    return decryptedData
}

