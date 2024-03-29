#  RxUpbitTicker

토이 프로젝트를 통해 RxSwift에 대한 이해도를 높이는 프로젝트

Upbit에서 제공하는 API를 통해 업비트 시세 조회앱을 만들어보면서 RxSwift의 이해도를 높힌다.

## 구현할 기능

- 업비트에 등록된 KRW 마켓의 모든 종목에 대한 현재 시세 모니터링 기능

## 개발 환경

- XCode12.4
- Swift5.3.2
- macOS11.2.1
- iOS13 target

## 사용 라이브러리

- RxSwift
- RxCocoa
- StarScream (WebSocket)
- ~SwiftLint~ (변수명에서 너무 많은 에러 발생...;)

## 구상하는 아키텍처 패턴

- MVVM

## 디자인 목업

![mockup](mockup.jpeg)

---

원래 하고싶었던거 (이상)
- 웹소켓으로 실시간 데이터를 받아서 테이블뷰에 뿌려주고 바뀐 데이터가 있으면 그 코인만 따로 업데이트 된걸 보여준다

현실
- rx를 어떻게 적용해야할지 모른다
    - bind 어떻게 해야합니까
- 딕셔너리로 테이블뷰를 뿌릴려고 하니까 데이터소스에서 해당 코인을 찾는 귀찮은 과정이 있다

단계별로 차근차근..

1. api매니저와 모델 구성
2. 데이터를 일단 rx안쓰고 뿌려본다
3. 이걸 rx하게 고쳐본다
4. TickerManager에서 코인별로 리스트를 꾸려서 뿌려본다..
