import Foundation
import Kitura
import LoggerAPI
import Configuration
import CloudEnvironment
import KituraContracts
import Health
import KituraWebSocket
import KituraNet

public class BattleServerDelegate: ServerDelegate {
    public func handle(request: ServerRequest, response: ServerResponse) {
        
    }
}

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
    
    func postInit() throws {
        // Endpoints
        initializeAThirdRoute(app: self)
    }
    
    public func run() throws {
        try postInit()
        server = Kitura.addHTTPServer(onPort: 8080, with: router)                
        Kitura.run()
    }
}
