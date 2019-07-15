import Foundation
import Kitura
import KituraContracts

func initializeAThirdRoute(app: App) {
    app.router.post("/aThird/setupUser") { (user: User?, respondWith: ((User?, RequestError?) -> ())) in
        guard let user = user, !user.name.isEmpty else {
            return respondWith(nil, .internalServerError)
        }        
    }
}
