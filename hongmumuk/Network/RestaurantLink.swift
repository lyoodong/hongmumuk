//
//  restrauntLink.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/06/20.
//

import UIKit


func getRestaurantLink(for restaurant:String, platform: String) -> URL? {
    let restaurantName = restaurant
    
    switch (restaurantName, platform) {
        //한식
    case ("집밥김치찌개", "naver"):
        return URL(string: "https://naver.me/G7yZnRj3")
    case ("집밥김치찌개", "kakao"):
        return URL(string: "https://place.map.kakao.com/1718126650")
    case ("한석화", "naver"):
        return URL(string: "https://naver.me/GLKw0xKS")
    case ("한석화", "kakao"):
        return URL(string: "https://place.map.kakao.com/1993290266")
    case ("국시와 가래떡", "naver"):
        return URL(string: "https://naver.me/GFp6dQrf")
    case ("국시와 가래떡", "kakao"):
        return URL(string: "https://place.map.kakao.com/14734012")
    case ("율촌", "naver"):
        return URL(string: "https://naver.me/xTeG4fub")
    case ("율촌", "kakao"):
        return URL(string: "https://place.map.kakao.com/24580312")
    case ("제순식당", "naver"):
        return URL(string: "https://naver.me/Fa3Sf9u2")
    case ("제순식당", "kakao"):
        return URL(string: "https://place.map.kakao.com/490667330")
    case ("발바리네", "naver"):
        return URL(string: "https://naver.me/IFjFAnPq")
    case ("발바리네", "kakao"):
        return URL(string: "http://kko.to/EIQUkLuAMs")
    case ("금복식당", "naver"):
        return URL(string: "https://naver.me/Gi9sddAD")
    case ("금복식당", "kakao"):
        return URL(string: "https://place.map.kakao.com/1722785841")
    case ("후계동", "naver"):
        return URL(string: "https://naver.me/GrSqA7zz")
    case ("후계동", "kakao"):
        return URL(string: "http://kko.to/drEicYbgL0")
    case ("다락투", "naver"):
        return URL(string: "https://naver.me/FArQ0N71")
    case ("다락투", "kakao"):
        return URL(string: "http://kko.to/mbQ9WHy3I-")

        
        //중식
    case ("카이화", "naver"):
        return URL(string: "https://naver.me/xdIkBfe0")
    case ("카이화", "kakao"):
        return URL(string: "https://place.map.kakao.com/570518757")
    case ("명장", "naver"):
        return URL(string: "https://naver.me/5xlj37Q2")
    case ("명장", "kakao"):
        return URL(string: "https://place.map.kakao.com/1237520308")
    case ("향차이", "naver"):
        return URL(string: "https://naver.me/5Aq4fm0H")
    case ("향차이", "kakao"):
        return URL(string: "https://place.map.kakao.com/957182243")
    case ("환시앙", "naver"):
        return URL(string: "https://naver.me/GulKaGh7")
    case ("환시앙", "kakao"):
        return URL(string: "https://place.map.kakao.com/1056365433")
    case ("손오공마라탕 서교점", "naver"):
        return URL(string: "https://naver.me/GWFrxjxt")
    case ("손오공마라탕 서교점", "kakao"):
        return URL(string: "https://place.map.kakao.com/474254018")
    case ("타오마라탕", "naver"):
        return URL(string: "https://naver.me/xuCo4a5K")
    case ("타오마라탕", "kakao"):
        return URL(string: "https://place.map.kakao.com/2088827518")
    case ("짬뽕지존", "naver"):
        return URL(string: "https://naver.me/G6iwP4Rn")
    case ("짬뽕지존", "kakao"):
        return URL(string: "https://place.map.kakao.com/2082473107")
    case ("샤오바오", "naver"):
        return URL(string: "https://naver.me/G1IftBzu")
    case ("샤오바오", "kakao"):
        return URL(string: "https://place.map.kakao.com/2145716193")
    case ("신주양꼬치", "naver"):
        return URL(string: "https://naver.me/5L3o0RIT")
    case ("신주양꼬치", "kakao"):
        return URL(string: "https://place.map.kakao.com/26873353")

        //일식
    case ("소코아", "naver"):
        return URL(string: "https://naver.me/G99stgXV")
    case ("소코아", "kakao"):
        return URL(string: "https://place.map.kakao.com/1426286680")
    case ("카미야", "naver"):
        return URL(string: "https://naver.me/FpXMPQnn")
    case ("카미야", "kakao"):
        return URL(string: "https://place.map.kakao.com/12771116")
    case ("겐로쿠우동", "naver"):
        return URL(string: "https://naver.me/xTeS3hZo")
    case ("겐로쿠우동", "kakao"):
        return URL(string: "https://place.map.kakao.com/12437276")
    case ("칸다소바", "naver"):
        return URL(string: "https://naver.me/FNmlmEOE")
    case ("칸다소바", "kakao"):
        return URL(string: "https://place.map.kakao.com/2057792795")
    case ("유익상스시", "naver"):
        return URL(string: "https://naver.me/xorKaKsH")
    case ("유익상스시", "kakao"):
        return URL(string: "https://place.map.kakao.com/1653817475")
    case ("카츠업", "naver"):
        return URL(string: "https://naver.me/IMpSqxJy")
    case ("카츠업", "kakao"):
        return URL(string: "https://place.map.kakao.com/1318186006")
    case ("히메시야", "naver"):
        return URL(string: "https://naver.me/Goz554bk")
    case ("히메시야", "kakao"):
        return URL(string: "https://place.map.kakao.com/21960086")
    case ("멘타카무쇼", "naver"):
        return URL(string: "https://naver.me/5zJo6mlA")
    case ("멘타카무쇼", "kakao"):
        return URL(string: "https://place.map.kakao.com/1704662385")
    case ("라멘트럭", "naver"):
        return URL(string: "https://naver.me/GfaMoA49")
    case ("라멘트럭", "kakao"):
        return URL(string: "https://place.map.kakao.com/1859634829")

        
        //양식
    case ("아티장 깔조네", "naver"):
        return URL(string: "https://naver.me/5012okWF")
    case ("아티장 깔조네", "kakao"):
        return URL(string: "https://place.map.kakao.com/1694657356")
    case ("바리", "naver"):
        return URL(string: "https://naver.me/xFptjoT3")
    case ("바리", "kakao"):
        return URL(string: "https://place.map.kakao.com/2052188089")
    case ("봉대박파스타", "naver"):
        return URL(string: "https://naver.me/5rsMJ2rE")
    case ("봉대박파스타", "kakao"):
        return URL(string: "https://place.map.kakao.com/1056158711")
    case ("롤링파스타", "naver"):
        return URL(string: "https://naver.me/GKovMpo5")
    case ("롤링파스타", "kakao"):
        return URL(string: "https://place.map.kakao.com/1680046810")
    case ("진짜파스타", "naver"):
        return URL(string: "https://naver.me/xhHnAQnZ")
    case ("진짜파스타", "kakao"):
        return URL(string: "https://place.map.kakao.com/1591202287")
    case ("이양권반상", "naver"):
        return URL(string: "https://naver.me/xgaIMeEu")
    case ("이양권반상", "kakao"):
        return URL(string: "https://place.map.kakao.com/1978020868")
    case ("윤씨밀방", "naver"):
        return URL(string: "https://naver.me/5MUCs2hm")
    case ("윤씨밀방", "kakao"):
        return URL(string: "https://place.map.kakao.com/13113825")
    case ("비스트로주라", "naver"):
        return URL(string: "https://naver.me/xrP6Wq73")
    case ("비스트로주라", "kakao"):
        return URL(string: "https://place.map.kakao.com/27272711")
    case ("안녕 파스타씨", "naver"):
        return URL(string: " https://naver.me/F5bF5qNW")
    case ("안녕 파스타씨", "kakao"):
        return URL(string: "https://place.map.kakao.com/27197796")
        
        //아시안
    case ("포보", "naver"):
        return URL(string: "https://naver.me/GXEAmQpC")
    case ("포보", "kakao"):
        return URL(string: "https://place.map.kakao.com/19032335")
    case ("알촌", "naver"):
        return URL(string: "https://naver.me/FfWLQhiB")
    case ("알촌", "kakao"):
        return URL(string: "https://place.map.kakao.com/1289781956")
    case ("미분당", "naver"):
        return URL(string: "https://naver.me/GsTOukcc")
    case ("미분당", "kakao"):
        return URL(string: "https://place.map.kakao.com/1551661200")
    case ("더 키친 아시아 인도", "naver"):
        return URL(string: "https://naver.me/FwnAibqF")
    case ("더 키친 아시아 인도", "kakao"):
        return URL(string: "https://place.map.kakao.com/228801586")
    case ("델리인디아", "naver"):
        return URL(string: "https://naver.me/Fk5dbzJm")
    case ("델리인디아", "kakao"):
        return URL(string: "https://place.map.kakao.com/27416360")
    case ("산띠", "naver"):
        return URL(string: "https://naver.me/GAi6krWy")
    case ("산띠", "kakao"):
        return URL(string: "https://place.map.kakao.com/9926329")
    case ("1976샤브샤브 ", "naver"):
        return URL(string: "https://naver.me/GEAu92kC")
    case ("1976샤브샤브 ", "kakao"):
        return URL(string: "https://place.map.kakao.com/21358621")
    case ("침사추이누들", "naver"):
        return URL(string: "https://naver.me/Gw5ErJ2R")
    case ("침사추이누들", "kakao"):
        return URL(string: "https://place.map.kakao.com/352051170")
    case ("에이시안", "naver"):
        return URL(string: "https://naver.me/Go5154qZ")
    case ("에이시안", "kakao"):
        return URL(string: "https://place.map.kakao.com/1709780448")
        
        //페푸
    case ("스매쉬보이", "naver"):
        return URL(string: "https://naver.me/5fnjJdjC")
    case ("스매쉬보이", "kakao"):
        return URL(string: "https://place.map.kakao.com/1677721147")
    case ("식스티즈", "naver"):
        return URL(string: "https://naver.me/5aVtf9Q3")
    case ("식스티즈", "kakao"):
        return URL(string: "https://place.map.kakao.com/488474938")
    case ("서브웨이", "naver"):
        return URL(string: "https://naver.me/xkxbRLKX")
    case ("서브웨이", "kakao"):
        return URL(string: "https://place.map.kakao.com/285790744")
    case ("샌드프레소", "naver"):
        return URL(string: "https://naver.me/x4blJKiz")
    case ("샌드프레소", "kakao"):
        return URL(string: "https://place.map.kakao.com/1693089943")
    case ("맘스터치", "naver"):
        return URL(string: "https://naver.me/F0Kww608")
    case ("맘스터치", "kakao"):
        return URL(string: "https://place.map.kakao.com/27469228")
    case ("버거킹", "naver"):
        return URL(string: "https://naver.me/F1IrRPKx")
    case ("버거킹", "kakao"):
        return URL(string: "https://place.map.kakao.com/723372106")
    case ("더 피자 보이즈", "naver"):
        return URL(string: "https://naver.me/GeW5O3FW")
    case ("더 피자 보이즈", "kakao"):
        return URL(string: "https://place.map.kakao.com/27548461")
    case ("에그드랍", "naver"):
        return URL(string: "https://naver.me/FIgoWp1s")
    case ("에그드랍", "kakao"):
        return URL(string: "https://place.map.kakao.com/1267694470")

        
    case ("또보겠지", "naver"):
        return URL(string: "https://naver.me/FjoACQRW")
    case ("또보겠지", "kakao"):
        return URL(string: "https://place.map.kakao.com/895272833")
    case ("삼청당", "naver"):
        return URL(string: "https://naver.me/GEALmHaf")
    case ("삼청당", "kakao"):
        return URL(string: "https://place.map.kakao.com/2081735366")
    case ("삭", "naver"):
        return URL(string: "https://naver.me/xRQPPk6X")
    case ("삭", "kakao"):
        return URL(string: "https://place.map.kakao.com/19909925")
    case ("봉봉", "naver"):
        return URL(string: "https://naver.me/Fjo7Pq8a")
    case ("봉봉", "kakao"):
        return URL(string: "https://place.map.kakao.com/824668308")
    case ("그동네떡볶이", "naver"):
        return URL(string: "https://naver.me/5tjeOb7E")
    case ("그동네떡볶이", "kakao"):
        return URL(string: "https://place.map.kakao.com/25859396")
    case ("김가네", "naver"):
        return URL(string: "https://naver.me/5aVvOv9s")
    case ("김가네", "kakao"):
        return URL(string: "https://place.map.kakao.com/26932953")
    case ("봉구가래떡볶이", "naver"):
        return URL(string: "https://naver.me/5G57W4Mm")
    case ("봉구가래떡볶이", "kakao"):
        return URL(string: " https://place.map.kakao.com/2011916768")
    case ("지지고", "naver"):
        return URL(string: "https://naver.me/GEAI3qGb")
    case ("지지고", "kakao"):
        return URL(string: "https://place.map.kakao.com/20125512")
    case ("홍분식", "naver"):
        return URL(string: "https://naver.me/GBlaQJsv")
    case ("홍분식", "kakao"):
        return URL(string: "https://place.map.kakao.com/1735205837")
        
        //기타
    case ("더그리니치", "naver"):
        return URL(string: "https://naver.me/GNyPrWIa")
    case ("더그리니치", "kakao"):
        return URL(string: "https://place.map.kakao.com/1287662476")
    case ("샌디 빌리지", "naver"):
        return URL(string: "https://naver.me/GHDYP3p6")
    case ("샌디 빌리지", "kakao"):
        return URL(string: "https://place.map.kakao.com/326057387")
    case ("구스토타코", "naver"):
        return URL(string: "https://naver.me/52lhlK0O")
    case ("구스토타코", "kakao"):
        return URL(string: "https://place.map.kakao.com/20885402")
    case ("도시락집 미미", "naver"):
        return URL(string: "https://naver.me/xdIkifHt")
    case ("도시락집 미미", "kakao"):
        return URL(string: "https://place.map.kakao.com/404647637")
    case ("긴자료코", "naver"):
        return URL(string: "https://naver.me/5Tv3XLvW")
    case ("긴자료코", "kakao"):
        return URL(string: "https://place.map.kakao.com/468200097")
    case ("상수 냉장고", "naver"):
        return URL(string: "https://naver.me/GbEcCupJ")
    case ("상수 냉장고", "kakao"):
        return URL(string: "https://place.map.kakao.com/1753129148")
    case ("무쇠김치삼겹살", "naver"):
        return URL(string: "https://naver.me/FhAdCwEM")
    case ("무쇠김치삼겹살", "kakao"):
        return URL(string: "https://place.map.kakao.com/75559616")
    case ("넙딱집", "naver"):
        return URL(string: "https://naver.me/FuVE56G5")
    case ("넙딱집", "kakao"):
        return URL(string: "https://place.map.kakao.com/375498117")
    case ("등촌", "naver"):
        return URL(string: "https://naver.me/GbEcPRYr")
    case ("등촌", "kakao"):
        return URL(string: "https://place.map.kakao.com/11088775")
    
    default:
        return nil
    }
}

