import Foundation

public protocol EnumeratedTableViewDescription: RawRepresentable<Int>, CaseIterable {
    public static func numberOfSections() -> Int
    public static func title(for section: Int) -> String?
    public static func numberOfRows(in section: Int) -> Int
    public static func item(for section: Int, and row: Int) -> (any CaseIterable)?
}

public extension EnumeratedTableViewDescription {
    static func numberOfSections() -> Int {
        return Self.allCases.count
    }
}
