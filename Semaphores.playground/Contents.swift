


import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


let queue = DispatchQueue(label: "MyQueue.semaphores", attributes: .concurrent)

let semaphore = DispatchSemaphore(value: 2) // queue threads 0 - 1 - 0 - 1 - 0 - 1 - 2

queue.async {
    semaphore.wait(timeout: .distantFuture)
    Thread.sleep(forTimeInterval: 4)
    print("Block 1")
//    semaphore.signal()
}

queue.async {
    semaphore.wait(timeout: .distantFuture)
    Thread.sleep(forTimeInterval: 2)
    print("Block 2")
    semaphore.signal()
}

queue.async {
    semaphore.wait(timeout: .distantFuture)
    print("Block 3")
    semaphore.signal()
    
}

queue.async {
    semaphore.wait(timeout: .distantFuture)
    print("Block 4")
//    semaphore.signal()
}
