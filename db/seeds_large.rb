require 'faker'

# 한글 지역 설정
Faker::Config.locale = 'ko'

# 기존 데이터 삭제
puts "기존 데이터 삭제 중..."
Booking.destroy_all
Service.destroy_all
Shop.destroy_all
User.destroy_all

# 서울 주요 지역
seoul_districts = [
  { name: "강남구", lat: 37.5172, lng: 127.0473 },
  { name: "서초구", lat: 37.4837, lng: 127.0324 },
  { name: "송파구", lat: 37.5145, lng: 127.1066 },
  { name: "마포구", lat: 37.5663, lng: 126.9019 },
  { name: "용산구", lat: 37.5384, lng: 126.9654 },
  { name: "성동구", lat: 37.5633, lng: 127.0371 },
  { name: "광진구", lat: 37.5385, lng: 127.0823 },
  { name: "동작구", lat: 37.5124, lng: 126.9394 },
  { name: "종로구", lat: 37.5735, lng: 126.9790 },
  { name: "중구", lat: 37.5641, lng: 126.9979 }
]

# 헤어샵 이름 부분
hair_prefixes = ["로레알", "준오", "리안", "박승철", "이철", "청담", "압구정", "차홍", "고운", "미용실"]
hair_suffixes = ["헤어", "살롱", "헤어샵", "헤어스튜디오", "뷰티살롱", "헤어부티크"]

# 뷰티샵 이름 부분  
beauty_prefixes = ["더퀸", "네일", "뷰티", "에스테틱", "스킨", "페이셜", "왁싱", "속눈썹", "아름", "미인"]
beauty_suffixes = ["네일", "스파", "에스테틱", "뷰티", "케어", "클리닉", "살롱", "스튜디오"]

# 헬스장 이름 부분
gym_prefixes = ["파워", "스트롱", "머슬", "휘트니스", "바디", "피지컬", "애니타임", "크로스핏", "운동", "헬스"]
gym_suffixes = ["짐", "피트니스", "휘트니스", "헬스클럽", "스포츠센터", "트레이닝센터"]

# 필라테스 이름 부분
pilates_prefixes = ["바디", "코어", "리폼", "클래식", "모던", "파워", "프리미엄", "더", "필라", "요가"]
pilates_suffixes = ["필라테스", "필라테스스튜디오", "무브먼트", "바디워크", "스튜디오", "센터"]

# 사용자 생성
puts "사용자 생성 중..."
10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: "password123",
    name: Faker::Name.name,
    phone: "010-#{rand(1000..9999)}-#{rand(1000..9999)}",
    role: "customer"
  )
end

# 카테고리별 매장 생성
categories = [
  { 
    type: 'hair_salon', 
    count: 100,
    name_prefixes: hair_prefixes,
    name_suffixes: hair_suffixes,
    services: [
      { name: "여성커트", price: 25000, duration: 60 },
      { name: "남성커트", price: 18000, duration: 40 },
      { name: "염색", price: 80000, duration: 120 },
      { name: "펌", price: 120000, duration: 180 },
      { name: "클리닉", price: 50000, duration: 60 },
      { name: "스타일링", price: 30000, duration: 40 },
      { name: "매직스트레이트", price: 200000, duration: 240 },
      { name: "뿌리염색", price: 40000, duration: 60 }
    ]
  },
  { 
    type: 'beauty_shop',
    count: 100,
    name_prefixes: beauty_prefixes,
    name_suffixes: beauty_suffixes,
    services: [
      { name: "젤네일", price: 50000, duration: 90 },
      { name: "패디큐어", price: 40000, duration: 60 },
      { name: "속눈썹연장", price: 60000, duration: 90 },
      { name: "왁싱(전신)", price: 150000, duration: 120 },
      { name: "페이셜케어", price: 80000, duration: 60 },
      { name: "아쿠아필링", price: 100000, duration: 90 },
      { name: "눈썹정리", price: 15000, duration: 30 },
      { name: "반영구화장", price: 300000, duration: 180 }
    ]
  },
  { 
    type: 'gym',
    count: 100,
    name_prefixes: gym_prefixes,
    name_suffixes: gym_suffixes,
    services: [
      { name: "1개월 이용권", price: 70000, duration: 30 },
      { name: "3개월 이용권", price: 180000, duration: 30 },
      { name: "6개월 이용권", price: 300000, duration: 30 },
      { name: "1년 이용권", price: 500000, duration: 30 },
      { name: "PT 10회", price: 500000, duration: 60 },
      { name: "PT 20회", price: 900000, duration: 60 },
      { name: "PT 30회", price: 1200000, duration: 60 },
      { name: "일일권", price: 15000, duration: 30 }
    ]
  },
  { 
    type: 'pilates',
    count: 100,
    name_prefixes: pilates_prefixes,
    name_suffixes: pilates_suffixes,
    services: [
      { name: "그룹레슨 1회", price: 40000, duration: 50 },
      { name: "그룹레슨 10회", price: 350000, duration: 50 },
      { name: "그룹레슨 20회", price: 650000, duration: 50 },
      { name: "개인레슨 1회", price: 80000, duration: 50 },
      { name: "개인레슨 10회", price: 700000, duration: 50 },
      { name: "개인레슨 20회", price: 1300000, duration: 50 },
      { name: "듀엣레슨", price: 60000, duration: 50 },
      { name: "체험레슨", price: 30000, duration: 50 }
    ]
  }
]

shop_count = 0

categories.each do |category|
  puts "#{category[:type]} 매장 생성 중..."
  
  category[:count].times do
    district = seoul_districts.sample
    
    # 위도/경도에 약간의 랜덤 오프셋 추가 (약 5km 범위)
    lat_offset = (rand(-50..50) / 1000.0)
    lng_offset = (rand(-50..50) / 1000.0)
    
    shop_name = "#{category[:name_prefixes].sample} #{category[:name_suffixes].sample}"
    
    opening_hours = {
      "월요일" => "#{rand(9..11)}:00-#{rand(20..22)}:00",
      "화요일" => "#{rand(9..11)}:00-#{rand(20..22)}:00",
      "수요일" => "#{rand(9..11)}:00-#{rand(20..22)}:00",
      "목요일" => "#{rand(9..11)}:00-#{rand(20..22)}:00",
      "금요일" => "#{rand(9..11)}:00-#{rand(20..22)}:00",
      "토요일" => "#{rand(10..11)}:00-#{rand(18..20)}:00",
      "일요일" => rand < 0.5 ? "휴무" : "#{rand(10..12)}:00-#{rand(17..19)}:00"
    }
    
    descriptions = case category[:type]
    when 'hair_salon'
      [
        "프리미엄 헤어 디자인과 최신 트렌드를 선도하는 헤어샵입니다.",
        "20년 경력의 수석 디자이너가 당신만의 스타일을 만들어드립니다.",
        "천연 제품만을 사용하여 모발 손상을 최소화합니다.",
        "최신 시설과 편안한 분위기에서 힐링하세요."
      ]
    when 'beauty_shop'
      [
        "네일아트부터 피부관리까지 토탈 뷰티케어를 제공합니다.",
        "숙련된 전문가들이 세심한 관리를 약속드립니다.",
        "최고급 제품만을 사용하여 만족스러운 결과를 보장합니다.",
        "프라이빗한 공간에서 편안한 관리를 받으실 수 있습니다."
      ]
    when 'gym'
      [
        "최신 운동기구와 넓은 공간을 자랑하는 프리미엄 헬스장입니다.",
        "전문 트레이너의 1:1 맞춤 운동 프로그램을 제공합니다.",
        "24시간 운영으로 언제든 편하게 이용하실 수 있습니다.",
        "샤워실, 사우나 등 편의시설이 완비되어 있습니다."
      ]
    when 'pilates'
      [
        "소수정예 그룹레슨으로 섬세한 지도를 받으실 수 있습니다.",
        "최신 기구와 전문 강사진이 함께합니다.",
        "체형 교정과 근력 강화에 특화된 프로그램을 운영합니다.",
        "쾌적한 환경에서 건강한 몸만들기를 시작하세요."
      ]
    end
    
    shop = Shop.create!(
      name: shop_name,
      description: descriptions.sample,
      address: "서울특별시 #{district[:name]} #{Faker::Address.street_name} #{rand(1..100)}",
      latitude: district[:lat] + lat_offset,
      longitude: district[:lng] + lng_offset,
      phone: "02-#{rand(100..999)}-#{rand(1000..9999)}",
      category: category[:type],
      opening_hours: opening_hours
    )
    
    # 서비스 생성 (랜덤하게 5-8개)
    category[:services].sample(rand(5..8)).each do |service_data|
      # 가격에 약간의 변동 추가 (±20%)
      price_variation = (service_data[:price] * rand(-0.2..0.2)).to_i
      final_price = service_data[:price] + price_variation
      final_price = (final_price / 1000).round * 1000 # 천원 단위로 반올림
      
      shop.services.create!(
        name: service_data[:name],
        description: "#{service_data[:name]} 서비스를 전문적으로 제공합니다.",
        price: final_price,
        duration: service_data[:duration]
      )
    end
    
    shop_count += 1
    print "\r총 #{shop_count}개 매장 생성 완료" if shop_count % 10 == 0
  end
end

puts "\n\n시드 데이터 생성 완료!"
puts "생성된 데이터:"
puts "- 사용자: #{User.count}명"
puts "- 매장: #{Shop.count}개"
puts "- 서비스: #{Service.count}개"
puts "\n카테고리별 매장 수:"
Shop.group(:category).count.each do |category, count|
  puts "- #{category}: #{count}개"
end