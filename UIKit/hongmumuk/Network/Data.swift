//
//  meal.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/05/20.
//

import Foundation

class Data {
    static let shared = Data()
    private init() { }
    
    var categories: [CategoryRestaurants] = [
        //한식 
        CategoryRestaurants(name: .koreanFood, restaurants: [
            Restaurant(name: "집밥김치찌개", location: (37.54915210095082, 126.92202163309558)),
            Restaurant(name: "한석화", location: (37.54817889607994, 126.92183027093608)),
            Restaurant(name: "국시와 가래떡", location: (37.55259037808539, 126.92350339421354)),
            Restaurant(name: "율촌", location: (37.552832162325245, 126.92469708402946)),
            Restaurant(name: "제순식당", location: (37.548768894002485, 126.9215948410951)),
            Restaurant(name: "발바리네", location: (37.55328226741065, 126.92767017449005)),
            Restaurant(name: "금복식당", location: (37.5473659827024, 126.92219040636064)),
            Restaurant(name: "후계동", location: (37.54759992429666, 126.92170922695952)),
            Restaurant(name: "다락투", location: (37.55271429636011, 126.9235513644673))
        ]),
        
        //중식
        CategoryRestaurants(name: .chineseFood, restaurants: [
            Restaurant(name: "카이화", location: (37.547944428314985, 126.92151649127072)),
            Restaurant(name: "명장", location: (37.547992380967884, 126.92250095091332)),
            Restaurant(name: "향차이", location: (37.549478312576476, 126.92487869201287)),
            Restaurant(name: "환시앙", location: (37.54909633863749, 126.92285910278044)),
            Restaurant(name: "손오공마라탕", location: (37.55230673439399, 126.92035476831343)),
            Restaurant(name: "타오마라탕", location: (37.552456744247756, 126.92237467191912)),
            Restaurant(name: "짬뽕지존", location: (37.54894637311053, 126.9208930414859)),
            Restaurant(name: "샤오바오", location: (37.55223395530973, 126.92269177471131)),
            Restaurant(name: "신주양꼬치", location: (37.55040079090692, 126.92325383836368))
        ]),
        
        //일식
        CategoryRestaurants(name: .japaneseFood, restaurants: [
            Restaurant(name: "소코아", location: (37.54864233560762, 126.92096691877622)),
            Restaurant(name: "카미야", location: (37.55257837515834, 126.92236888731742)),
            Restaurant(name: "겐로쿠우동", location: (37.54875000848749, 126.9203019712677)),
            Restaurant(name: "칸다소바", location: (37.549283179103384, 126.92268067690918)),
            Restaurant(name: "유익상스시", location: (37.5539943890996, 126.92460254843282)),
            Restaurant(name: "카츠업", location: (37.55375729576094, 126.92369742107307)),
            Restaurant(name: "히메시야", location: (37.54866958285299, 126.92129223387086)),
            Restaurant(name: "멘타카무쇼", location: (37.548200954476584, 126.92112864117833)),
            Restaurant(name: "라멘트럭", location: (37.547472115858774, 126.92259484759413))
        ]),
        
        //양식
        CategoryRestaurants(name: .westernFood, restaurants: [
            Restaurant(name: "아티장 깔조네", location: (37.54873382728103, 126.92307448641452)),
            Restaurant(name: "안녕 파스타씨", location: (37.55223748223147, 126.92121209322106)),
            Restaurant(name: "바리", location: (37.55143729901209, 126.92381012435844)),
            Restaurant(name: "봉대박파스타", location: (37.55376179160388, 126.92368327014138)),
            Restaurant(name: "롤링파스타", location: (37.553282247779485, 126.9240515618328)),
            Restaurant(name: "진짜파스타", location: (37.55021835727352, 126.92328231677656)),
            Restaurant(name: "이양권반상", location: (37.555115787875565, 126.92765425581402)),
            Restaurant(name: "윤씨밀방", location: (37.54964788457695, 126.92237758497403)),
            Restaurant(name: "비스트로주라", location: (37.5539966542373, 126.92462235110023))
        ]),
        
        //센터 로고
        CategoryRestaurants(name: .centerLogo, restaurants: []),
        
        //아시안
        CategoryRestaurants(name: .asianFood, restaurants: [
            Restaurant(name: "포보", location: (37.55282699057621, 126.92365876025671)),
            Restaurant(name: "알촌", location: (37.549339205371034, 126.92224493726619)),
            Restaurant(name: "미분당", location: (37.55441013149105, 126.93035974322503)),
            Restaurant(name: "더 키친 아시아 인도", location: (37.554563438823784, 126.92331181437338)),
            Restaurant(name: "델리인디아", location: (37.548691081527124, 126.91976733829195)),
            Restaurant(name: "산띠", location: (37.55553758610638, 126.92497729545762)),
            Restaurant(name: "1976샤브샤브", location: (37.54805982008915, 126.92229436014713)),
            Restaurant(name: "침사추이누들", location: (37.54943378603793, 126.91887254228222)),
            Restaurant(name: "에이시안", location: (37.54887031445807, 126.92168243648696))
        ]),
        
        //페스트푸드
        CategoryRestaurants(name: .fastFood, restaurants: [
            Restaurant(name: "스매쉬보이", location: (37.54897830079682, 126.92148145820161)),
            Restaurant(name: "식스티즈", location: (37.55347166058296, 126.92436824658478)),
            Restaurant(name: "서브웨이", location: (37.54827663163339, 126.9231683153137)),
            Restaurant(name: "테이스티버거", location: (37.54822770590087, 126.92071274111767)),
            Restaurant(name: "샌드프레소", location: (37.552832162325245, 126.92469708402946)),
            Restaurant(name: "맘스터치", location: (37.552832162325245, 126.92469708402946)),
            Restaurant(name: "버거킹", location: (37.552654653122055, 126.91856915541238)),
            Restaurant(name: "더 피자 보이즈", location: (37.548591883272024, 126.91963730720917)),
            Restaurant(name: "에그드랍", location: (37.54792453244336, 126.92208515096453))
        ]),
        
        //분식
        CategoryRestaurants(name: .schoolFood, restaurants: [
            Restaurant(name: "또보겠지", location: (37.552805943882085, 126.9224705036745)),
            Restaurant(name: "삼청당", location: (37.5530944531098, 126.92628402623245)),
            Restaurant(name: "삭", location: (37.54794655278889, 126.92132411366032)),
            Restaurant(name: "봉봉", location: (37.54921308244882, 126.92227053015888)),
            Restaurant(name: "그동네떡볶이", location: (37.55412914580363, 126.92757316037327)),
            Restaurant(name: "김가네", location: (37.553327609648406, 126.92453814734937)),
            Restaurant(name: "봉구가래떡볶이", location: (37.5490963404857, 126.92286193187176)),
            Restaurant(name: "지지고", location: (37.553424376351, 126.92439658693719)),
            Restaurant(name: "홍분식", location: (37.55343563519231, 126.9243909170491))
        ]),
        
        //기타
        CategoryRestaurants(name: .etcFood, restaurants: [
            Restaurant(name: "더그리니치", location: (37.54751149607869, 126.92427242364549)),
            Restaurant(name: "샌디 빌리지", location: (37.54718385208255, 126.92268001629633)),
            Restaurant(name: "구스토타코", location: (37.548134495679214, 126.92281765814954)),
            Restaurant(name: "도시락집 미미", location: (37.554313155875136, 126.92644975396576)),
            Restaurant(name: "긴자료코", location: (37.55545622958022, 126.92455863563373)),
            Restaurant(name: "상수 냉장고", location: (37.54658026662313, 126.9228079446408)),
            Restaurant(name: "무쇠김치삼겹살", location: (37.55263039040986, 126.92268570676703)),
            Restaurant(name: "넙딱집", location: (37.54752101140955, 126.92506454346197)),
            Restaurant(name: "등촌", location: (37.553745572247465, 126.92298728651191))
        ])
    ]
    
    func getRandomCategory() -> CategoryRestaurants?   {
        
        var removeCenterLogo = categories
        removeCenterLogo.remove(at: 4)
        
        guard let randomCategory = removeCenterLogo.randomElement() else {
            return nil
        }
        
        return randomCategory
        
    }
    
    func getRandomRestaurant(randomCategory:CategoryRestaurants) -> Restaurant? {
        guard let randomRestaurant = randomCategory.restaurants.randomElement() else {
            return nil
        }
        return randomRestaurant
    }

}

