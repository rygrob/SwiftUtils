import Foundation

public class ConsecutiveIntegers {
    public static func strings(from min: Int, through max: Int) -> [String] {
        guard min < max else { return [] }
        
        var strings: [String] = []
        
        var num = min
        
        while num <= max {
            strings.append(String(num))
            num += 1
        }
        
        return strings
    }
}
