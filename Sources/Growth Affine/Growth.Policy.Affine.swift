public import Affine
public import Growth

extension Growth.Policy where Element: ~Copyable {

    /// Creates a growth policy that scales capacity by an affine ratio.
    @inlinable
    public static func factor(
        _ scale: Affine.Discrete.Ratio<Element, Element>
    ) -> Self {
        .custom { current in
            let result = Int(bitPattern: current.rawValue) * scale.factor
            precondition(result >= 0, "Scaled capacity must be non-negative")
            return Cardinal(UInt(Swift.max(result, 1)))
        }
    }
}
