import Foundation
import Kitura
import LoggerAPI
import Configuration
import CloudEnvironment
import KituraContracts
import KituraWebSocket
import KituraNet

public let projectPath = ConfigurationManager.BasePath.project.path

public class App {
    
    var server: HTTPServer?
    
    let router = { () -> Router in
        let router = Router()
        return router
    }()
    
    public init() {
        // Run the metrics initializer
        initializeSwiftMetrics()
    }
    
    public func run() {        
        let port = Int(ProcessInfo.processInfo.environment["PORT"] ?? "8080") ?? 8080
        server = Kitura.addHTTPServer(onPort: port, with: router)        
        Kitura.run()
    }
}
