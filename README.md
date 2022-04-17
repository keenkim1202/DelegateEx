# DelegateEx
Delegate 패턴에 대한 아주 간단한 예제

## Delegate 패턴에 대하여
- iOS에서 자주 사용되는 디자인 패턴이다. (ex. `tableView.delegate = self`)
- delegate(위임자)를 갖고 있는 객체가 다른 객체에게 자신의 일을 `위임`하는 형태의 디자인 패턴
  - 구현해야할 메서드 목록을 프로토콜로 작성
  - 해당 프로토콜을 준수하여 delegate를 가지고 있는 다른 객체에서 메서드를 작성
- 효율성 관점에서 아주 중요하다
  - 왜? : 기능을 위임할 객체가 있다는 것 = 그만큼 직접 구현할 부분이 적다는 것 (큰 규모의 프로그램을 빠르게 작성할 수 있다.)
  - `extension`을 사용하면, 프로토콜 메서드들을 한 곳에 모아 훨신 깔끔하게 작성할 수 있다.

## 언제 사용하는가
- 하나의 객체가 해야하는 일이 여러가지일 때 사용한다.
  - (Notification을 통해서도 객체간 소통을 할 수 있는데, 이는 한 객체의 변화를 여러 객체들이 관찰해야하는 경우 즉, 수신받는 객체가 많을 때 사용함)

## 주의사항
- Deleate 프로퍼티 변수에 `weak` 을 사용하지 않는다면, `강한 참조 순환`으로 메모리 누수가 발생할 수 있다.
  - protocol을 `class` 로 구현하여 `weak`을 사용하면 메모리 누수를 방지할 수 있다.

그런데 protocol을 class로 구현하면 다음과 같은 워닝이 뜬다.
  
```
Using 'class' keyword to define a class-constrained protocol is deprecated; use 'AnyObject' instead
```
- `class`는 deprecated되어서 `AnyObject`를 대신 사용한다.
- `AnyObject` : 모든 `class` 타입의 인스턴스를 나타낼 수 있다. (`class` 타입만 저장 가능)
-> class의 내부도 결국 AnyObject 이라 deprecate 된 것으로 알고 있음


## 프로젝트 설명
- delegate가 준수해야할 `SomeDelegate` Protocol 정의
- 커스텀뷰 클래스 안에 `var delegate: SomeDelegate?` 선언
  - 커스텀뷰는 `SomeView.xib`를 사용해 구성
- ViewController에서 
  - `viewDidLoad()`에 `someView.delegate = self` 선언
  - `extension`을 통해 `SomeDelegate` 프로토콜을 준수하여 메서드 작성
