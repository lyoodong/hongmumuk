<img src= "snapshot/홍무묵 스냅샷.png" align="left" >

# hongmumuk

> 핵심 기능
> 
- 네이버 지도 API를 활용해 식당 어노테이션 표기
- 네이버 블로그 API를 활용해 블로그 후기 정보 제공
- 랜덤 선택 기능

---

> 기술 스택
> 
- **언어**: Swift
- **프레임워크**:  UIkit
- **디자인패턴**: MVC, Singleton
- **라이브러리**: Alamofire, SnapKit, Gifu, NMapsMap

---

> 서비스
> 
- **최소 버전**: iOS 13.0
- **개발 인원**: 1인
- **개발 기간** : 2023.05 ~ 2023.09.04, 현재 지속적으로 서비스 운영 중(ver 1.1.1)
- **iOS 앱스토어:** [홍무묵바로가기](https://apps.apple.com/kr/app/홍무묵-홍대-무묵지/id6464114749)
- **협업**: Git, Figma
- **누적 다운로드:** 831건 (2023.10.30 기준)
- **앱스토어 랭킹**:  및 음료 카테고리 앱 **33**위 랭크 (2023.09.20 일)

---

> 트러블 슈팅
> 
1. 화면 전환 코드 **모듈화**

**Issue**

- 화면 전환 코드 **모듈화**

**Solution**

- `Enum`으로 화면전환 스타일을 열거 후 모듈화

```swift
extension UIViewController {
    
    enum TransitionStyle {
        case present
        case presentNavigation
        case presentFullNavigation
        case push
    }
    
    func transition<T:UIViewController> (viewController:T, style: TransitionStyle) {
        switch style {
        case .present:
            present(viewController, animated: true)
            
        case.presentFullNavigation:
            let nav = UINavigationController(rootViewController: viewController)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
            
        case.presentNavigation:
            let nav = UINavigationController(rootViewController: viewController)
            present(nav, animated: true)
            
        case.push:
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
```

**Result**

- 코드 가독성 증대
- 화면전환 스타일을 명확히 파악 가능 

```swift
//기존 코드: 코드의 통일성이 없고 한눈에 알아보기 어려움
let vc = SampleViewController()

present(vc, animated: true) 
	 
let nav = UINavigationController(rootViewController: vc)
nav.modalPresentationStyle = .fullScreen
present(nav, animated: true)

let nav = UINavigationController(rootViewController: viewController)
present(nav, animated: true)

navigationController?.pushViewController(viewController, animated: true)

//개선 코드
transition(viewController: vc, style: .present)
transition(viewController: vc, style: .presentFullNavigation)
transition(viewController: vc, style: .presentNavigation)
transition(viewController: vc, style: .push)
```

2. 화면의 상태에 따른 CollectionView Cell의 즉각적인 titleLabel 업데이트 이슈
**Issue**

- `isSelectedCategory`상태에 따라 `cellTitleArray`가 업데이트 되고 이후, `reloadData()`를 통해 컬랙션뷰를 업데이트
- `cellTitleArray`가 변화하는 시점에 매번 수동으로 `reloadData()`를 호출하는 코드 작성

**Solution**

- `didSet`을 활용해 즉각적으로 `cellTitleArray` 변화 대응

**Result**

- 휴먼에러 방지
- `cellTitleArray`의 변화 따라 UI 업데이트를 즉각적으로 대응

```swift
//기존에 수동적으로 매번 업데이트 시점을 지정
func visibleDateSet() {
        
        if isSelectedCategory == false {
            cellTitleArray = Category.allCases.map { $0.rawValue }
            mainCollectionView.reloadData()
        }
    }

func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		.
		.
		.
		else {
				self.isSelectedCategory.toggle()
				self.configurePopButton()
				self.configureOtherButton()
				self.cateogory = Data.shared.categories[indexPath.row].name.rawValue
				let data = Data.shared.categories[indexPath.row].restaurants
				self.cellTitleArray = data.map { $0.name }
				self.mainCollectionView.reloadData()
				}
          
    }

//개선 후, 수동으로 업데이트 시점을 지정한 코드 모두 삭제
var cellTitleArray:[String] = [] {
        didSet {
            mainCollectionView.reloadData()
        }
    }
```
---

> Version History
> 
- ver 1.0.0
    - (23.09.04) 심사 통과
- ver 1.1.0
    - (23.09.06) 1차 리젝: 애플 맵 및 Contact Page 추가 요청
    - (23.09.10) 수정 후 제출, 심사 통과
    - (23.09.10) 업데이트 내용: API 키 누락된 부분 수정, 애플 맵 및 Contact Page 추가
- ver 1.1.1
    - (23.09.14) 심사 통과
    - (23.09.14) 업데이트 내용: 일부 UI 디테일 수정

---

> 회고
> 

**What I Learned**

- 기획, 디자인, 개발, 출시까지 작지만 **iOS 개발의 사이클 경험**
- View 와 ViewController를 분리함으로서 **Massive ViewController** 문제 해결
- **Codable**을 활용한 네트워크 처리
- **Sington**을 통해 데이터 접근성 향상

**Areas for Improvement**

- 네트워크 예외 처리
- 구글 드라이브에 Json 형태로 데이터 저장

**개발 동기**

 개발 동아리 스터디 중, 작더라도 하나의 결과물을 만들어보자는 동기로 시작했다. 물론 학기 중에 각자의 스케줄이 있기 때문에 공수가 엄청나게 소요되는 규모는 지양해야 했고, 가장 무난하면서도 적당히 퀄리티를 낼 수 있는 ‘맛집’을 콘텐츠로 잡고 앱을 기획했다. 

**UI**

UI는 이전에 한 미대생 분이 제작하신 **맛집 만다라트**에 아이디어를 얻어서 제작했다. CollectionView를 통해 **3X3**화면을 구성해 한 화면에 음식 종류 별로 9개의 식당을 넣었다. 

**로직**

로직 측면에서 가장 어려웠던 점은 CollectionView를 재사용해 Cell에 정보를 업데이트하는 것이었다. 단순하게 8개의 뷰컨트롤러를 생성하면 되지만, 재사용성을 증대하기 위해 화면의 상태에 따라 정보를 업데이트 했다. 화면의 상태를 저장할 변수 하나를 생성하고, 상태에 따라 분기 처리를 통해 Cell에 표기될 정보/클릭 시 이벤트/ 버튼 Hidden 처리 등을 수행했다. 

**지표 분석 - 충돌**

우연하게 새싹 멘토님께서 애플에서 제공한 앱 관련 지표를 보시면서, **충돌**에 대한 이야기를 해주셨다. 애플에서 제공하는 지표 중 **충돌**이 의미하는 것은 말 그대로 사용자가 **앱을 사용하다 터진 비율**이었다. 현재 기준으로 약 7건의 충돌이 발생했는데, 이러한 수치는 반드시 0에 수렴하도록 해야 한다는 것이 골자였다. 이를 통해 에러 처리나 강제 해제 연산자에 대한 주의가 더 필요하다고 생각했다.

---

> 📒 커밋 메시지 형식
> 

| 유형 | 설명 | 예시 |
| --- | --- | --- |
| FIX | 버그 또는 오류 해결 | [FIX] #10 - 콜백 오류 수정 |
| ADD | 새로운 코드, 라이브러리, 뷰, 또는 액티비티 추가 | [ADD] #11 - LoginActivity 추가 |
| FEAT | 새로운 기능 구현 | [FEAT] #11 - Google 로그인 추가 |
| DEL | 불필요한 코드 삭제 | [DEL] #12 - 불필요한 패키지 삭제 |
| REMOVE | 파일 삭제 | [REMOVE] #12 - 중복 파일 삭제 |
| REFACTOR | 내부 로직은 변경하지 않고 코드 개선 (세미콜론, 줄바꿈 포함) | [REFACTOR] #15 - MVP 아키텍처를 MVVM으로 변경 |
| CHORE | 그 외의 작업 (버전 코드 수정, 패키지 구조 변경, 파일 이동 등) | [CHORE] #20 - 불필요한 패키지 삭제 |
| DESIGN | 화면 디자인 수정 | [DESIGN] #30 - iPhone 12 레이아웃 조정 |
| COMMENT | 필요한 주석 추가 또는 변경 | [COMMENT] #30 - 메인 뷰컨 주석 추가 |
| DOCS | README 또는 위키 등 문서 내용 추가 또는 변경 | [DOCS] #30 - README 내용 추가 |
| TEST | 테스트 코드 추가 | [TEST] #30 - 로그인 토큰 테스트 코드 추가 |

### SnapShot 및 기타
<img width="588" alt="스크린샷 2023-10-25 오후 7 20 57" src="https://github.com/UMC-clutch/iOS_clutch/assets/115209527/81d91215-f5f0-42e2-a25f-5ec94926bdda">
