import Foundation
import Kitura
import LoggerAPI
import HeliumLogger
import Application
import KituraWebSocket
import KituraNet

WebSocket.register(service: BattleWebSocketService(), onPath: "battle")

HeliumLogger.use(LoggerMessageType.info)
let app = App()
app.run()
