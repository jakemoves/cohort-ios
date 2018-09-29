//
//  CHSession.swift
//  Cohort-iOS
//
//  Created by Jacob Niedzwiecki on 2018-09-29.
//  Copyright © 2018 Jacob Niedzwiecki. All rights reserved.
//

import UIKit
import Starscream
import Alamofire

public class CHSession: NSObject{
    private let serverURL: URL
    private var socketURL: URL
    private var httpURL: URL
    
    private var socket: WebSocket
    
    
    public var isConnected: Bool {
        get { return socket.isConnected }
    }
    
    public init(cohortServerURL url: URL){
        serverURL = url
        
        var baseURL = URLComponents()
        baseURL.scheme = serverURL.scheme
        baseURL.host = serverURL.host
        
        // socket server
        baseURL.port = 8080
        socketURL = baseURL.url!
        socket = WebSocket(url: socketURL)
        
        // http server
        baseURL.port = 3000
        httpURL = baseURL.url!
        
        super.init()
        
        socket.delegate = self
    }
    
    public func connect(completion: (_ result: Bool) -> ()){
        socket.connect()
        while (!isConnected) {}
        return completion(true)
    }
    
    public func registerForNotifications(token: Data, completion: (_ result: Bool) -> ()){
        let tokenString = token.hexString()
        debugPrint(tokenString)
        let serverString = httpURL.absoluteString + "/register-for-notifications"
        debugPrint(serverString)
        let params: Parameters = [ "token": tokenString ]
        Alamofire.request(serverString, method: .post, parameters: params, encoding: JSONEncoding.default).validate()
    }
}

extension CHSession: WebSocketDelegate {
    public func websocketDidConnect(socket: WebSocketClient) {
        
    }
    
    public func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        
    }
    
    public func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        
    }
    
    public func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        
    }
}

extension Data {
    func hexString() -> String {
        var bytesPointer: UnsafeBufferPointer<UInt8> = UnsafeBufferPointer(start: nil, count: 0)
        self.withUnsafeBytes { (bytes) in
            bytesPointer = UnsafeBufferPointer<UInt8>(start: UnsafePointer(bytes), count:self.count)
        }
        let hexBytes = bytesPointer.map { return String(format: "%02hhx", $0) }
        return hexBytes.joined()
    }
}
