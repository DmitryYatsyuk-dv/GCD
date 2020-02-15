
import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


let queue = DispatchQueue(label: "ru.yatsyuk.dev@mail", attributes: .concurrent)
let group = DispatchGroup()

queue.async(group: group) {
    for i in 0...10 {
        if i == 10 {
            print(i)
        }
    }
}

queue.async(group: group) {
    for i in 0...20 {
        if i == 20 {
            print(i)
        }
    }
}

group.notify(queue: .main) {
    print("Все закончено в группе: group")
}

let secondGroup = DispatchGroup()
secondGroup.enter()
queue.async(group: secondGroup) {
    for i in 0...30 {
        if i == 30 {
            print(i)
            sleep(1)
            secondGroup.leave()
        }
    }
}
let result = secondGroup.wait(timeout: .now() + 3)
print(result)

secondGroup.notify(queue: .main) {
    print("Все Закончено в группе: secondGroup")
}

print("Последний в коде принт")

secondGroup.wait()



