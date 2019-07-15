import Foundation
import Kitura
import LoggerAPI
import HeliumLogger
import Application
import KituraWebSocket
import KituraNet

WebSocket.register(service: BattleWebSocketService(), onPath: "battle")

do {
    HeliumLogger.use(LoggerMessageType.info)
    let app = App()
    try app.run()
} catch let error {
    Log.error(error.localizedDescription)
}
