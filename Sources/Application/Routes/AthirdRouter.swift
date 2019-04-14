import Foundation
import Kitura
import KituraContracts

func initializeAThirdRoute(app: App) {
    
    app.router.post("/aThird/setupUser") { (me: Me?, respondWith: ((Me?, RequestError?) -> ())) in
        guard let me = me, !me.name.isEmpty else { return respondWith(nil, .internalServerError) }
        
    }
}
