import ChaChaRNG
import simd

/// Generates random data using a ChaCha RNG seeded with the provided seed.
func generateManyChaChaSeeded(mySeed: [UInt8], length: Int) -> [UInt8] {
    let mySeedConverted = convertToSIMD8(from: mySeed)
    var rng = ChaCha8RNG(seed: mySeedConverted)
    return (0..<length).map { _ in UInt8.random(in: 0 ... .max, using: &rng) }
}

/// Converts a 32-byte `UInt8` array to a `SIMD8<UInt32>` seed.
func convertToSIMD8(from array: [UInt8]) -> SIMD8<UInt32> {
    assert(array.count == 32, "Seed must have exactly 32 bytes.")
    
    var uint32Values: [UInt32] = []
    for i in stride(from: 0, to: array.count, by: 4) {
        let combined = (UInt32(array[i]) << 24) |
                       (UInt32(array[i + 1]) << 16) |
                       (UInt32(array[i + 2]) << 8) |
                        UInt32(array[i + 3])
        uint32Values.append(combined)
    }
    
    return SIMD8(uint32Values)
}

