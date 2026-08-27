import Affine
import Growth
import Growth_Affine
import Testing

@Suite struct `Growth.Policy.Affine Tests` {

    @Test
    func `factor scales current capacity`() {
        let scale = Affine.Discrete.Ratio<UInt8, UInt8>(3)
        let policy = Growth.Policy<UInt8>.factor(scale)

        #expect(policy.capacity(from: Cardinal(4)).rawValue == UInt(12))
    }

    @Test
    func `factor floors capacity at one`() {
        let scale = Affine.Discrete.Ratio<UInt8, UInt8>(3)
        let policy = Growth.Policy<UInt8>.factor(scale)

        #expect(policy.capacity(from: Cardinal(0)).rawValue == UInt(1))
    }

    @Test
    func `zero factor floors capacity at one`() {
        let scale = Affine.Discrete.Ratio<UInt8, UInt8>(0)
        let policy = Growth.Policy<UInt8>.factor(scale)

        #expect(policy.capacity(from: Cardinal(8)).rawValue == UInt(1))
    }
}
