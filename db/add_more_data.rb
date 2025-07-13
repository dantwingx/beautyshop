# 더 많은 샘플 데이터 생성

# 서울 주요 지역
seoul_districts = [
  { name: "강남구", areas: ["역삼동", "삼성동", "청담동", "논현동", "신사동", "압구정동", "대치동", "도곡동"] },
  { name: "서초구", areas: ["서초동", "반포동", "잠원동", "방배동", "양재동", "내곡동", "우면동"] },
  { name: "송파구", areas: ["잠실동", "송파동", "가락동", "문정동", "장지동", "위례동", "오금동"] },
  { name: "마포구", areas: ["홍대", "합정동", "상수동", "망원동", "연남동", "성산동", "상암동"] },
  { name: "용산구", areas: ["이태원동", "한남동", "용산동", "효창동", "이촌동", "한강로동"] },
  { name: "종로구", areas: ["광화문", "종로", "인사동", "삼청동", "혜화동", "동숭동", "성균관로"] },
  { name: "중구", areas: ["명동", "을지로", "충무로", "회현동", "필동", "장충동", "신당동"] },
  { name: "성동구", areas: ["성수동", "왕십리", "행당동", "금호동", "옥수동", "한양대"] }
]

# 샵 이름 템플릿
hair_salon_names = [
  "헤어살롱", "헤어스튜디오", "헤어부티크", "헤어아뜰리에", "헤어갤러리",
  "헤어플레이스", "헤어라운지", "헤어클리닉", "헤어팩토리", "헤어샵"
]

hair_salon_prefixes = [
  "준오", "차홍", "이철", "박준", "라뷰", "아르디", "고우넷", "리안", "제니하우스", 
  "블루클럽", "레드카펫", "그레이스", "엘리트", "프리미엄", "로얄", "골드", "실버",
  "크리스탈", "다이아몬드", "펄", "루비", "에메랄드", "사파이어", "모던", "클래식",
  "뉴욕", "파리", "밀라노", "런던", "도쿄", "서울", "강남", "청담", "압구정"
]

beauty_shop_names = [
  "뷰티살롱", "네일아트", "뷰티스튜디오", "뷰티클리닉", "뷰티부티크",
  "뷰티갤러리", "뷰티라운지", "뷰티팩토리", "뷰티플레이스", "뷰티샵"
]

beauty_prefixes = [
  "미미", "루루", "라라", "모모", "코코", "나나", "다다", "보보", "소소", "유유",
  "블루밍", "블라썸", "플라워", "가든", "로즈", "릴리", "데이지", "튤립", "아이리스",
  "뷰티풀", "프리티", "러블리", "큐티", "스위티", "글로우", "샤인", "스파클"
]

gym_names = [
  "피트니스", "휘트니스", "짐", "스포츠센터", "헬스클럽", "트레이닝센터",
  "운동센터", "웰니스센터", "바디짐", "머슬짐"
]

gym_prefixes = [
  "스트롱", "파워", "머슬", "피트", "바디", "헬스", "웰니스", "라이프", "에너지",
  "다이나믹", "액티브", "스포티", "애슬릿", "챔피온", "마스터", "프로", "엘리트",
  "골드", "플래티넘", "타이탄", "아이언", "스틸", "록", "스톤", "파이어"
]

pilates_names = [
  "필라테스", "필라테스스튜디오", "필라테스센터", "필라테스클럽", "필라테스랩",
  "필라테스하우스", "필라테스룸", "필라테스짐", "필라테스플레이스"
]

pilates_prefixes = [
  "바디라인", "코어", "밸런스", "플로우", "무브먼트", "하모니", "센터드", "얼라인",
  "포스쳐", "브리드", "플렉스", "스트레치", "톤", "린", "피트", "웰", "라이프",
  "그레이스", "엘레강스", "뷰티", "헬시", "프레시", "퓨어", "클린", "내추럴"
]

# 서비스 템플릿
hair_services = [
  { name: "여성 커트", price_range: [30000, 80000], duration: 60 },
  { name: "남성 커트", price_range: [20000, 50000], duration: 40 },
  { name: "펌", price_range: [80000, 300000], duration: 180 },
  { name: "염색", price_range: [60000, 200000], duration: 120 },
  { name: "클리닉", price_range: [50000, 150000], duration: 90 },
  { name: "스타일링", price_range: [30000, 80000], duration: 60 },
  { name: "매직스트레이트", price_range: [150000, 400000], duration: 240 },
  { name: "디지털펌", price_range: [100000, 350000], duration: 180 },
  { name: "발레아쥬", price_range: [150000, 500000], duration: 240 },
  { name: "하이라이트", price_range: [100000, 300000], duration: 180 },
  { name: "두피케어", price_range: [40000, 100000], duration: 60 },
  { name: "헤어스파", price_range: [50000, 120000], duration: 90 }
]

beauty_services = [
  { name: "네일아트", price_range: [30000, 100000], duration: 90 },
  { name: "젤네일", price_range: [40000, 80000], duration: 60 },
  { name: "패디큐어", price_range: [35000, 70000], duration: 60 },
  { name: "속눈썹연장", price_range: [50000, 150000], duration: 120 },
  { name: "반영구화장", price_range: [200000, 800000], duration: 180 },
  { name: "왁싱", price_range: [20000, 100000], duration: 60 },
  { name: "페이셜", price_range: [50000, 200000], duration: 90 },
  { name: "바디마사지", price_range: [80000, 300000], duration: 120 },
  { name: "아이브로우", price_range: [30000, 80000], duration: 60 },
  { name: "래쉬리프팅", price_range: [40000, 90000], duration: 60 },
  { name: "네일케어", price_range: [25000, 60000], duration: 45 },
  { name: "핸드케어", price_range: [30000, 70000], duration: 60 }
]

gym_services = [
  { name: "1개월 이용권", price_range: [50000, 150000], duration: 30 },
  { name: "3개월 이용권", price_range: [120000, 400000], duration: 30 },
  { name: "6개월 이용권", price_range: [200000, 700000], duration: 30 },
  { name: "1년 이용권", price_range: [350000, 1200000], duration: 30 },
  { name: "PT 10회", price_range: [500000, 1000000], duration: 60 },
  { name: "PT 20회", price_range: [900000, 1800000], duration: 60 },
  { name: "PT 30회", price_range: [1200000, 2500000], duration: 60 },
  { name: "그룹PT 10회", price_range: [300000, 600000], duration: 60 },
  { name: "일일권", price_range: [10000, 30000], duration: 30 },
  { name: "주말이용권", price_range: [80000, 200000], duration: 30 }
]

pilates_services = [
  { name: "개인레슨 1회", price_range: [70000, 150000], duration: 50 },
  { name: "개인레슨 10회", price_range: [600000, 1300000], duration: 50 },
  { name: "개인레슨 20회", price_range: [1100000, 2400000], duration: 50 },
  { name: "그룹레슨 1회", price_range: [30000, 70000], duration: 50 },
  { name: "그룹레슨 10회", price_range: [250000, 600000], duration: 50 },
  { name: "그룹레슨 20회", price_range: [450000, 1100000], duration: 50 },
  { name: "듀엣레슨 10회", price_range: [400000, 900000], duration: 50 },
  { name: "체형분석", price_range: [50000, 100000], duration: 60 },
  { name: "재활필라테스", price_range: [80000, 180000], duration: 50 },
  { name: "산전필라테스", price_range: [80000, 160000], duration: 50 }
]

# 스타일리스트 이름
stylist_names = [
  "김민수", "이지은", "박서준", "최유나", "정하늘", "강민지", "윤서연", "임태양",
  "손예진", "안소희", "류진우", "오민서", "하준호", "문채원", "배수지", "조은별",
  "신동욱", "김나라", "이준기", "박민영", "정우성", "한지민", "송중기", "김태희",
  "현빈", "손나은", "이민호", "박보영", "김수현", "배수지", "조인성", "송혜교"
]

# 설명 템플릿
descriptions = [
  "고객님의 아름다움을 최고로 만들어드립니다.",
  "최신 트렌드와 전문 기술로 만족도 높은 서비스를 제공합니다.",
  "편안한 분위기에서 최고의 서비스를 경험하세요.",
  "전문가의 손길로 새로운 변화를 만들어드립니다.",
  "고객 맞춤형 서비스로 특별한 경험을 선사합니다.",
  "최고급 제품과 숙련된 기술로 프리미엄 서비스를 제공합니다.",
  "트렌디하고 스타일리시한 공간에서 즐기는 뷰티 케어",
  "당신의 개성을 살려드리는 맞춤형 스타일링",
  "건강하고 아름다운 변화를 위한 토탈 뷰티 케어",
  "전문가와 함께하는 나만의 뷰티 타임"
]

puts "기존 데이터 삭제 중..."
Booking.destroy_all
TimeSlot.destroy_all
Stylist.destroy_all
Service.destroy_all
Shop.destroy_all

puts "새로운 샵 데이터 생성 중..."

shop_count = 0

seoul_districts.each do |district|
  district[:areas].each do |area|
    # 각 지역마다 헤어샵 3-5개
    rand(3..5).times do
      prefix = hair_salon_prefixes.sample
      suffix = hair_salon_names.sample
      
      shop = Shop.create!(
        name: "#{prefix} #{suffix}",
        category: 'hair_salon',
        address: "서울시 #{district[:name]} #{area} #{rand(1..500)}번지",
        phone: "02-#{rand(1000..9999)}-#{rand(1000..9999)}",
        description: descriptions.sample,
        latitude: 37.5665 + rand(-0.1..0.1),
        longitude: 126.9780 + rand(-0.1..0.1)
      )
      
      # 서비스 추가 (8-12개)
      hair_services.sample(rand(8..12)).each do |service_template|
        shop.services.create!(
          name: service_template[:name],
          price: rand(service_template[:price_range][0]..service_template[:price_range][1]),
          duration: service_template[:duration],
          description: "#{service_template[:name]} 전문 서비스입니다."
        )
      end
      
      # 스타일리스트 추가 (3-6명)
      rand(3..6).times do
        shop.stylists.create!(
          name: stylist_names.sample,
          specialty: ["커트", "펌", "염색", "스타일링"].sample,
          experience_years: rand(1..15),
          rating: rand(4.0..5.0).round(1),
          bio: "고객님께 최상의 서비스를 제공하겠습니다."
        )
      end
      
      shop_count += 1
    end
    
    # 각 지역마다 뷰티샵 2-4개
    rand(2..4).times do
      prefix = beauty_prefixes.sample
      suffix = beauty_shop_names.sample
      
      shop = Shop.create!(
        name: "#{prefix} #{suffix}",
        category: 'beauty_shop',
        address: "서울시 #{district[:name]} #{area} #{rand(1..500)}번지",
        phone: "02-#{rand(1000..9999)}-#{rand(1000..9999)}",
        description: descriptions.sample,
        latitude: 37.5665 + rand(-0.1..0.1),
        longitude: 126.9780 + rand(-0.1..0.1)
      )
      
      # 서비스 추가 (6-10개)
      beauty_services.sample(rand(6..10)).each do |service_template|
        shop.services.create!(
          name: service_template[:name],
          price: rand(service_template[:price_range][0]..service_template[:price_range][1]),
          duration: service_template[:duration],
          description: "#{service_template[:name]} 전문 서비스입니다."
        )
      end
      
      # 스타일리스트 추가 (2-4명)
      rand(2..4).times do
        shop.stylists.create!(
          name: stylist_names.sample,
          specialty: ["네일아트", "속눈썹", "왁싱", "페이셜"].sample,
          experience_years: rand(1..10),
          rating: rand(4.0..5.0).round(1),
          bio: "아름다움을 만들어드립니다."
        )
      end
      
      shop_count += 1
    end
    
    # 각 지역마다 헬스장 1-2개
    rand(1..2).times do
      prefix = gym_prefixes.sample
      suffix = gym_names.sample
      
      shop = Shop.create!(
        name: "#{prefix} #{suffix}",
        category: 'gym',
        address: "서울시 #{district[:name]} #{area} #{rand(1..500)}번지",
        phone: "02-#{rand(1000..9999)}-#{rand(1000..9999)}",
        description: descriptions.sample,
        latitude: 37.5665 + rand(-0.1..0.1),
        longitude: 126.9780 + rand(-0.1..0.1)
      )
      
      # 서비스 추가 (6-8개)
      gym_services.sample(rand(6..8)).each do |service_template|
        shop.services.create!(
          name: service_template[:name],
          price: rand(service_template[:price_range][0]..service_template[:price_range][1]),
          duration: service_template[:duration],
          description: "#{service_template[:name]} - 건강한 몸을 만들어드립니다."
        )
      end
      
      shop_count += 1
    end
    
    # 각 지역마다 필라테스 1-2개
    rand(1..2).times do
      prefix = pilates_prefixes.sample
      suffix = pilates_names.sample
      
      shop = Shop.create!(
        name: "#{prefix} #{suffix}",
        category: 'pilates',
        address: "서울시 #{district[:name]} #{area} #{rand(1..500)}번지",
        phone: "02-#{rand(1000..9999)}-#{rand(1000..9999)}",
        description: descriptions.sample,
        latitude: 37.5665 + rand(-0.1..0.1),
        longitude: 126.9780 + rand(-0.1..0.1)
      )
      
      # 서비스 추가 (6-8개)
      pilates_services.sample(rand(6..8)).each do |service_template|
        shop.services.create!(
          name: service_template[:name],
          price: rand(service_template[:price_range][0]..service_template[:price_range][1]),
          duration: service_template[:duration],
          description: "#{service_template[:name]} - 건강하고 균형잡힌 몸을 만들어드립니다."
        )
      end
      
      shop_count += 1
    end
  end
end

# 모든 스타일리스트에 대해 타임슬롯 생성
puts "타임슬롯 생성 중..."
Stylist.all.each do |stylist|
  stylist.generate_time_slots
end

puts "✅ 데이터 생성 완료!"
puts "📊 생성된 데이터:"
puts "- 총 샵 수: #{Shop.count}개"
puts "  - 헤어샵: #{Shop.where(category: 'hair_salon').count}개"
puts "  - 뷰티샵: #{Shop.where(category: 'beauty_shop').count}개"
puts "  - 헬스장: #{Shop.where(category: 'gym').count}개"
puts "  - 필라테스: #{Shop.where(category: 'pilates').count}개"
puts "- 총 서비스 수: #{Service.count}개"
puts "- 총 스타일리스트 수: #{Stylist.count}명"
puts "- 총 타임슬롯 수: #{TimeSlot.count}개"