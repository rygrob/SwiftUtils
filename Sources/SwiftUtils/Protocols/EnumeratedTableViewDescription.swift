import Foundation

public protocol EnumeratedTableViewDescription: RawRepresentable<Int>, CaseIterable {
    static func numberOfSections() -> Int
    static func title(for section: Int) -> String?
    static func numberOfRows(in section: Int) -> Int
    static func item(for section: Int, and row: Int) -> (any CaseIterable)?
}

public extension EnumeratedTableViewDescription {
    static func numberOfSections() -> Int {
        return Self.allCases.count
    }
}
