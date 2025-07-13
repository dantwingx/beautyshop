# 빠른 데이터 추가 스크립트

puts "추가 데이터 생성 시작..."

# 서울 주요 지역
areas = [
  "강남역", "삼성역", "선릉역", "역삼역", "신논현역", "논현역", "압구정역", "신사역",
  "홍대입구역", "합정역", "상수역", "망원역", "연남동", "연희동", "신촌역", "이대역",
  "이태원역", "한남동", "녹사평역", "경리단길", "해방촌", "용산역", "삼각지역",
  "성수역", "뚝섬역", "건대입구역", "왕십리역", "한양대역", "성수동", "서울숲",
  "종로3가", "인사동", "삼청동", "북촌", "경복궁역", "안국역", "광화문역",
  "명동역", "을지로입구역", "시청역", "충무로역", "동대문역", "회현역",
  "잠실역", "송파역", "가락시장역", "문정역", "장지역", "복정역", "석촌역",
  "서초역", "교대역", "방배역", "사당역", "낙성대역", "봉천역", "신림역"
]

# 샵 이름 조합
name_parts = {
  hair_salon: {
    prefix: ["준오", "차홍", "이철", "박준", "라뷰", "블루클럽", "제니하우스", "그레이", "리안", "모던", "클래식", "프리미엄", "로얄", "엘리트"],
    suffix: ["헤어", "헤어살롱", "헤어샵", "헤어스튜디오"]
  },
  beauty_shop: {
    prefix: ["미미", "루루", "코코", "블루밍", "플라워", "로즈", "뷰티풀", "프리티", "글로우", "샤인"],
    suffix: ["뷰티", "네일", "뷰티살롱", "네일아트"]
  },
  gym: {
    prefix: ["스트롱", "파워", "머슬", "피트", "바디", "헬스", "다이나믹", "골드"],
    suffix: ["짐", "피트니스", "휘트니스", "헬스클럽"]
  },
  pilates: {
    prefix: ["바디라인", "코어", "밸런스", "플로우", "하모니", "그레이스"],
    suffix: ["필라테스", "필라테스스튜디오"]
  }
}

# 카테고리별로 샵 추가
[:hair_salon, :beauty_shop, :gym, :pilates].each do |category|
  areas.sample(20).each do |area|
    name = "#{area} #{name_parts[category][:prefix].sample} #{name_parts[category][:suffix].sample}"
    
    shop = Shop.create!(
      name: name,
      category: category,
      address: "서울시 #{area} #{rand(1..300)}번지",
      phone: "02-#{rand(1000..9999)}-#{rand(1000..9999)}",
      description: "#{area}에서 최고의 서비스를 제공합니다.",
      latitude: 37.5665 + rand(-0.1..0.1),
      longitude: 126.9780 + rand(-0.1..0.1)
    )
    
    # 기본 서비스 추가
    case category
    when :hair_salon
      [
        { name: "여성커트", price: rand(35000..60000), duration: 60 },
        { name: "남성커트", price: rand(25000..40000), duration: 40 },
        { name: "펌", price: rand(80000..150000), duration: 180 },
        { name: "염색", price: rand(70000..130000), duration: 120 },
        { name: "클리닉", price: rand(50000..100000), duration: 90 }
      ].each { |s| shop.services.create!(s) }
      
      # 스타일리스트 추가
      rand(3..5).times do |i|
        shop.stylists.create!(
          name: ["김민수", "이지은", "박서준", "최유나", "정하늘"].sample + (i+1).to_s,
          specialty: ["커트", "펌", "염색"].sample,
          experience_years: rand(2..10),
          rating: rand(4.2..4.9).round(1)
        )
      end
      
    when :beauty_shop
      [
        { name: "젤네일", price: rand(40000..70000), duration: 60 },
        { name: "네일아트", price: rand(50000..90000), duration: 90 },
        { name: "패디큐어", price: rand(35000..60000), duration: 60 },
        { name: "속눈썹연장", price: rand(60000..120000), duration: 120 }
      ].each { |s| shop.services.create!(s) }
      
      # 스타일리스트 추가
      rand(2..3).times do |i|
        shop.stylists.create!(
          name: ["강민지", "윤서연", "손예진"].sample + (i+1).to_s,
          specialty: ["네일", "속눈썹", "왁싱"].sample,
          experience_years: rand(1..7),
          rating: rand(4.3..4.9).round(1)
        )
      end
      
    when :gym
      [
        { name: "1개월 이용권", price: rand(70000..120000), duration: 30 },
        { name: "3개월 이용권", price: rand(180000..300000), duration: 30 },
        { name: "PT 10회", price: rand(600000..900000), duration: 60 }
      ].each { |s| shop.services.create!(s) }
      
    when :pilates
      [
        { name: "개인레슨", price: rand(80000..120000), duration: 50 },
        { name: "그룹레슨", price: rand(40000..60000), duration: 50 },
        { name: "듀엣레슨", price: rand(60000..90000), duration: 50 }
      ].each { |s| shop.services.create!(s) }
    end
    
    print "."
  end
end

# 스타일리스트 타임슬롯 생성
puts "\n타임슬롯 생성 중..."
Stylist.where(time_slots: { id: nil }).joins("LEFT JOIN time_slots ON time_slots.stylist_id = stylists.id").each do |stylist|
  stylist.generate_time_slots
end

puts "\n✅ 완료!"
puts "총 샵: #{Shop.count}개"
puts "총 서비스: #{Service.count}개"  
puts "총 스타일리스트: #{Stylist.count}명"