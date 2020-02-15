import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


let queue = DispatchQueue(label: "myQueue.sources", attributes: .concurrent)

let timer = DispatchSource.makeTimerSource(queue: queue)

timer.schedule(deadline: .now(), repeating: .seconds(2), leeway: .milliseconds(300))

timer.setEventHandler {
    print("Hello World!")
}

timer.setCancelHandler {
    print("Timer is cancel")
}

timer.resume()


//let signalSource = DispatchSource.makeSignalSource(signal: SIGALRM, queue: queue)








