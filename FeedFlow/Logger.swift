import Foundation
import os.log

class AppLogger {
    static let shared = AppLogger()
    private let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "com.feedflow", category: "main")

    private init() {}

    func info(_ message: String) {
        logger.info("📘 \(message)")
    }

    func error(_ message: String) {
        logger.error("❌ \(message)")
    }

    func debug(_ message: String) {
        logger.debug("🔍 \(message)")
    }
}
