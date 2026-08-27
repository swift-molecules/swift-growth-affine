public import Affine
public import Growth
public import Index

extension Growth.Policy where Element: ~Copyable {

    @inlinable
    public static func factor(
        _ scale: Affine.Discrete.Ratio<Element, Element>
    ) -> Self {
        Self { Index<Element>.Count.max($0 * scale, .one) }
    }
}
