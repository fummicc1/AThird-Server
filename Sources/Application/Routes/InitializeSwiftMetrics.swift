import Foundation
import SwiftMetrics
import SwiftMetricsKitura

let swiftMetrics = try! SwiftMetrics()

func initializeSwiftMetrics() {
    SwiftMetricsKitura(swiftMetricsInstance: swiftMetrics)
    _ = swiftMetrics.monitor()
}
