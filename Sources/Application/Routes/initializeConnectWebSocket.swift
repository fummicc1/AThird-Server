import Foundation
import Kitura

func initializeConnectWebSocket(router: Router) {
    router.get("/connectWebSocket") { (request, response, next) in
        response.send("OK.")
    }
}
