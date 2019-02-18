

import CoreGraphics

struct ScrollPageController {

    /// Computes page offset from page offsets array for given scroll offset and velocity
    ///
    /// - Parameters:
    ///   - offset: current scroll offset
    ///   - velocity: current scroll velocity
    ///   - pageOffsets: page offsets array
    /// - Returns: target page offset from array or nil if no page offets provided
    func pageOffset(for offset: CGFloat, velocity: CGFloat, in pageOffsets: [CGFloat]) -> CGFloat? {
        let pages = pageOffsets.enumerated().reduce([Int: CGFloat]()) {
            var dict = $0
            dict[$1.0] = $1.1
            return dict
        }
        guard let page = pages.min(by: { abs($0.1 - offset) < abs($1.1 - offset) }) else {
            return nil
        }
        if abs(velocity) < 0.2 {
            return page.value
        }
        if velocity < 0 {
            return pages[pageOffsets.index(before: page.key)] ?? page.value
        }
        return pages[pageOffsets.index(after: page.key)] ?? page.value
    }

    /// Cumputes page fraction from page offsets array for given scroll offset
    ///
    /// - Parameters:
    ///   - offset: current scroll offset
    ///   - pageOffsets: page offsets array
    /// - Returns: current page fraction in range from 0 to number of pages or nil if no page offets provided
    func pageFraction(for offset: CGFloat, in pageOffsets: [CGFloat]) -> CGFloat? {
        let pages = pageOffsets.sorted().enumerated()
        if let index = pages.first(where: { $0.1 == offset })?.0 {
            return CGFloat(index)
        }
        guard let nextOffset = pages.first(where: { $0.1 >= offset })?.1 else {
            return pages.map { $0.0 }.last.map { CGFloat($0) }
        }
        guard let (prevIdx, prevOffset) = pages.reversed().first(where: { $0.1 <= offset }) else {
            return pages.map { $0.0 }.first.map { CGFloat($0) }
        }
        return CGFloat(prevIdx) + (offset - prevOffset) / (nextOffset - prevOffset)
    }

}
