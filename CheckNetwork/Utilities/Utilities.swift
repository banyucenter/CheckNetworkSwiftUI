//
//  Utilities.swift
//  CheckNetwork
//
//  Created by Ipung Dev Center on 30/08/20.
//  Copyright © 2020 Banyu Center. All rights reserved.
//

import Foundation
import Combine
import Network

class Utilities : ObservableObject {
    
    @Published var isConn : Bool = true
    
    func monitorNetwork() {
        let monitor : NWPathMonitor = NWPathMonitor()
        let queue = DispatchQueue(label: "Monitor")
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                OperationQueue.main.addOperation {
                    self.isConn = true
                }
            } else if path.status == .requiresConnection {
                OperationQueue.main.addOperation {
                    self.isConn = false
                }
            }
            else {
                OperationQueue.main.addOperation {
                    self.isConn = false
                }
            }
        }
        monitor.start(queue: queue)
    }
    
}
