import Foundation
import Kitura
import LoggerAPI
import Configuration
import CloudEnvironment
import KituraContracts
import Health
import KituraWebSocket

public let projectPath = ConfigurationManager.BasePath.project.path

public class App {
    let router = { () -> Router in
        let router = Router()
        return router
    }()
    
    public init() throws {
        // Run the metrics initializer
        initializeMetrics(router: router)
    }
    
    func postInit() throws {
        // Endpoints
        initializeAThirdRoute(app: self)
    }
    
    public func run() throws {
        try postInit()
        Kitura.addHTTPServer(onPort: 8080, with: router)
        Kitura.run()
    }
}
