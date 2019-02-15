import Quick
import Nimble
@testable import <#ModuleName#>

class ScrollPageControllerSpec: QuickSpec {
    override func spec() {
        describe("ScrollPageController") {
            var sut: ScrollPageController!

            beforeEach {
                sut = ScrollPageController()
            }

            it("should return nil page offset when no pages") {
                expect(sut.pageOffset(for: -1, velocity: 0, in: [])).to(beNil())
                expect(sut.pageOffset(for: 0, velocity: 2, in: [])).to(beNil())
                expect(sut.pageOffset(for: 1, velocity: -2, in: [])).to(beNil())
            }

            it("should return nil page fraction when no pages") {
                expect(sut.pageFraction(for: -1, in: [])).to(beNil())
                expect(sut.pageFraction(for: 0, in: [])).to(beNil())
                expect(sut.pageFraction(for: 1, in: [])).to(beNil())
            }

            describe("three pages") {
                var pagePoints: [CGFloat]!

                beforeEach {
                    pagePoints = [0, 100, 300]
                }

                it("should return correct page fraction") {
                    expect(sut.pageFraction(for: -1000, in: pagePoints)) == 0
                    expect(sut.pageFraction(for: 0, in: pagePoints)) == 0
                    expect(sut.pageFraction(for: 1, in: pagePoints)) == 0.01
                    expect(sut.pageFraction(for: 50, in: pagePoints)) == 0.5
                    expect(sut.pageFraction(for: 99, in: pagePoints)) == 0.99
                    expect(sut.pageFraction(for: 100, in: pagePoints)) == 1
                    expect(sut.pageFraction(for: 102, in: pagePoints)) == 1.01
                    expect(sut.pageFraction(for: 200, in: pagePoints)) == 1.5
                    expect(sut.pageFraction(for: 298, in: pagePoints)) == 1.99
                    expect(sut.pageFraction(for: 300, in: pagePoints)) == 2
                    expect(sut.pageFraction(for: 1000, in: pagePoints)) == 2
                }

                context("touch up") {
                    var velocity: CGFloat!

                    beforeEach {
                        velocity = 0
                    }

                    it("should return closest page offset") {
                        expect(sut.pageOffset(for: -1000, velocity: velocity, in: pagePoints)) == pagePoints[0]
                        expect(sut.pageOffset(for: 0, velocity: velocity, in: pagePoints)) == pagePoints[0]
                        expect(sut.pageOffset(for: 49, velocity: velocity, in: pagePoints)) == pagePoints[0]
                        expect(sut.pageOffset(for: 51, velocity: velocity, in: pagePoints)) == pagePoints[1]
                        expect(sut.pageOffset(for: 1000, velocity: velocity, in: pagePoints)) == pagePoints[2]
                    }
                }

                context("swipe left") {
                    var velocity: CGFloat!

                    beforeEach {
                        velocity = 2
                    }

                    it("should return next page offset") {
                        expect(sut.pageOffset(for: -1000, velocity: velocity, in: pagePoints)) == pagePoints[1]
                        expect(sut.pageOffset(for: 0, velocity: velocity, in: pagePoints)) == pagePoints[1]
                        expect(sut.pageOffset(for: 49, velocity: velocity, in: pagePoints)) == pagePoints[1]
                        expect(sut.pageOffset(for: 51, velocity: velocity, in: pagePoints)) == pagePoints[2]
                        expect(sut.pageOffset(for: 1000, velocity: velocity, in: pagePoints)) == pagePoints[2]
                    }
                }

                context("swipe right") {
                    var velocity: CGFloat!

                    beforeEach {
                        velocity = -2
                    }

                    it("should return previous page offset") {
                        expect(sut.pageOffset(for: -1000, velocity: velocity, in: pagePoints)) == pagePoints[0]
                        expect(sut.pageOffset(for: 0, velocity: velocity, in: pagePoints)) == pagePoints[0]
                        expect(sut.pageOffset(for: 49, velocity: velocity, in: pagePoints)) == pagePoints[0]
                        expect(sut.pageOffset(for: 51, velocity: velocity, in: pagePoints)) == pagePoints[0]
                        expect(sut.pageOffset(for: 1000, velocity: velocity, in: pagePoints)) == pagePoints[1]
                    }
                }
            }
        }
    }
}