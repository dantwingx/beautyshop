# Full sample data generator for Beauty Booking App
# Run with: rails runner db/generate_full_data.rb

puts "🚀 Starting full data generation..."
start_time = Time.now

# Clear existing data
puts "🗑️  Clearing existing data..."
Booking.destroy_all
TimeSlot.destroy_all
Service.destroy_all
Stylist.destroy_all
Shop.destroy_all
User.where.not(email: ['customer@example.com', 'owner@example.com']).destroy_all

# 1. Create Users
puts "👥 Creating users..."
users = []

# Create 20 customers
20.times do |i|
  users << User.create!(
    email: "customer#{i+1}@example.com",
    password: "password123",
    name: ['김민수', '이서연', '박지훈', '최유진', '정하늘', '강예원', '조은비', '윤서영', '장미래', '임소정',
           '한지혜', '오혜진', '서유진', '신보라', '송민아', '권나영', '황수빈', '안소희', '배주희', '문채원'].sample,
    phone: "010-#{rand(1000..9999)}-#{rand(1000..9999)}",
    role: "customer"
  )
end

# Create 5 shop owners
5.times do |i|
  users << User.create!(
    email: "owner#{i+1}@example.com",
    password: "password123",
    name: ['김사장', '이대표', '박원장', '최실장', '정매니저'][i],
    phone: "010-9999-#{i+1111}",
    role: "shop_owner"
  )
end

# 2. Create Shops
puts "🏪 Creating shops..."

# Seoul districts
districts = [
  { name: "강남구", lat: 37.5172, lng: 127.0473 },
  { name: "서초구", lat: 37.4837, lng: 127.0324 },
  { name: "송파구", lat: 37.5145, lng: 127.1066 },
  { name: "마포구", lat: 37.5663, lng: 126.9019 },
  { name: "용산구", lat: 37.5384, lng: 126.9654 },
  { name: "성동구", lat: 37.5633, lng: 127.0371 },
  { name: "광진구", lat: 37.5385, lng: 127.0823 },
  { name: "동작구", lat: 37.5124, lng: 126.9394 },
  { name: "종로구", lat: 37.5735, lng: 126.9790 },
  { name: "중구", lat: 37.5641, lng: 126.9979 },
  { name: "강동구", lat: 37.5301, lng: 127.1238 },
  { name: "강북구", lat: 37.6396, lng: 127.0257 },
  { name: "강서구", lat: 37.5509, lng: 126.8495 },
  { name: "관악구", lat: 37.4784, lng: 126.9516 },
  { name: "구로구", lat: 37.4954, lng: 126.8874 },
  { name: "금천구", lat: 37.4519, lng: 126.8954 },
  { name: "노원구", lat: 37.6542, lng: 127.0568 },
  { name: "도봉구", lat: 37.6688, lng: 127.0471 },
  { name: "동대문구", lat: 37.5744, lng: 127.0396 },
  { name: "서대문구", lat: 37.5791, lng: 126.9368 },
  { name: "양천구", lat: 37.5172, lng: 126.8664 },
  { name: "영등포구", lat: 37.5264, lng: 126.8963 },
  { name: "은평구", lat: 37.6176, lng: 126.9227 },
  { name: "중랑구", lat: 37.6063, lng: 127.0925 }
]

# Shop name components
hair_prefixes = ["로레알", "준오", "리안", "박승철", "이철", "청담", "압구정", "차홍", "고운", "미용실"]
hair_suffixes = ["헤어", "살롱", "헤어샵", "헤어스튜디오", "뷰티살롱", "헤어부티크", "헤어갤러리", "스타일"]

beauty_prefixes = ["더퀸", "네일", "뷰티", "에스테틱", "스킨", "페이셜", "왁싱", "속눈썹", "아름", "미인"]
beauty_suffixes = ["네일", "스파", "에스테틱", "뷰티", "케어", "클리닉", "살롱", "스튜디오", "부티크"]

gym_prefixes = ["파워", "스트롱", "머슬", "휘트니스", "바디", "피지컬", "애니타임", "크로스핏", "운동", "헬스"]
gym_suffixes = ["짐", "피트니스", "휘트니스", "헬스클럽", "스포츠센터", "트레이닝센터", "헬스장", "웰니스"]

pilates_prefixes = ["바디", "코어", "리폼", "클래식", "모던", "파워", "프리미엄", "더", "필라", "요가"]
pilates_suffixes = ["필라테스", "필라테스스튜디오", "무브먼트", "바디워크", "스튜디오", "센터", "필라테스센터", "웰니스"]

streets = ["테헤란로", "강남대로", "봉은사로", "언주로", "삼성로", "도산대로", "학동로", "역삼로", "선릉로", "논현로",
          "압구정로", "청담동길", "영동대로", "남부순환로", "올림픽로", "신사로", "도곡로", "대치동길"]

shops = []

# Create 125 shops of each category (total 500)
# Hair salons
125.times do |i|
  district = districts.sample
  shop_name = "#{hair_prefixes.sample} #{hair_suffixes.sample}"
  shop_name += " #{district[:name]}점" if i % 3 == 0
  
  shops << Shop.create!(
    name: shop_name,
    description: "프리미엄 헤어 디자인 전문샵입니다. 최고의 디자이너들이 트렌디한 스타일을 제안합니다.",
    address: "서울특별시 #{district[:name]} #{streets.sample} #{100 + i}-#{rand(1..99)}",
    latitude: district[:lat] + (rand - 0.5) * 0.02,
    longitude: district[:lng] + (rand - 0.5) * 0.02,
    phone: "02-#{rand(1000..9999)}-#{rand(1000..9999)}",
    category: "hair_salon",
    opening_hours: {
      monday: "10:00-20:00", tuesday: "10:00-20:00", wednesday: "10:00-20:00",
      thursday: "10:00-20:00", friday: "10:00-21:00", saturday: "10:00-19:00", sunday: "휴무"
    },
    image_urls: ["https://source.unsplash.com/400x300/?hair,salon,#{i}"]
  )
end

# Beauty shops
125.times do |i|
  district = districts.sample
  shop_name = "#{beauty_prefixes.sample} #{beauty_suffixes.sample}"
  shop_name += " #{district[:name]}점" if i % 3 == 0
  
  shops << Shop.create!(
    name: shop_name,
    description: "네일, 속눈썹, 왁싱, 피부관리 전문 뷰티샵입니다. 토탈 뷰티케어를 제공합니다.",
    address: "서울특별시 #{district[:name]} #{streets.sample} #{200 + i}-#{rand(1..99)}",
    latitude: district[:lat] + (rand - 0.5) * 0.02,
    longitude: district[:lng] + (rand - 0.5) * 0.02,
    phone: "02-#{rand(1000..9999)}-#{rand(1000..9999)}",
    category: "beauty_shop",
    opening_hours: {
      monday: "11:00-21:00", tuesday: "11:00-21:00", wednesday: "11:00-21:00",
      thursday: "11:00-21:00", friday: "11:00-22:00", saturday: "10:00-20:00", sunday: "10:00-19:00"
    },
    image_urls: ["https://source.unsplash.com/400x300/?beauty,nail,spa,#{i}"]
  )
end

# Gyms
125.times do |i|
  district = districts.sample
  shop_name = "#{gym_prefixes.sample} #{gym_suffixes.sample}"
  shop_name += " #{district[:name]}점" if i % 3 == 0
  
  shops << Shop.create!(
    name: shop_name,
    description: "최신 운동기구와 전문 트레이너가 있는 헬스장입니다. PT 프로그램도 운영합니다.",
    address: "서울특별시 #{district[:name]} #{streets.sample} #{300 + i}-#{rand(1..99)}",
    latitude: district[:lat] + (rand - 0.5) * 0.02,
    longitude: district[:lng] + (rand - 0.5) * 0.02,
    phone: "02-#{rand(1000..9999)}-#{rand(1000..9999)}",
    category: "gym",
    opening_hours: {
      monday: "06:00-23:00", tuesday: "06:00-23:00", wednesday: "06:00-23:00",
      thursday: "06:00-23:00", friday: "06:00-23:00", saturday: "08:00-21:00", sunday: "08:00-20:00"
    },
    image_urls: ["https://source.unsplash.com/400x300/?gym,fitness,workout,#{i}"]
  )
end

# Pilates studios
125.times do |i|
  district = districts.sample
  shop_name = "#{pilates_prefixes.sample} #{pilates_suffixes.sample}"
  shop_name += " #{district[:name]}점" if i % 3 == 0
  
  shops << Shop.create!(
    name: shop_name,
    description: "전문 강사진과 함께하는 프리미엄 필라테스 스튜디오입니다. 소수정예 레슨을 제공합니다.",
    address: "서울특별시 #{district[:name]} #{streets.sample} #{400 + i}-#{rand(1..99)}",
    latitude: district[:lat] + (rand - 0.5) * 0.02,
    longitude: district[:lng] + (rand - 0.5) * 0.02,
    phone: "02-#{rand(1000..9999)}-#{rand(1000..9999)}",
    category: "pilates",
    opening_hours: {
      monday: "07:00-21:00", tuesday: "07:00-21:00", wednesday: "07:00-21:00",
      thursday: "07:00-21:00", friday: "07:00-21:00", saturday: "09:00-18:00", sunday: "10:00-17:00"
    },
    image_urls: ["https://source.unsplash.com/400x300/?pilates,yoga,wellness,#{i}"]
  )
end

# 3. Create Services
puts "💼 Creating services..."

# Hair salon services
hair_services = [
  { name: "여성커트", desc: "전문 디자이너의 여성 헤어커트", price: 25000, duration: 60 },
  { name: "남성커트", desc: "전문 디자이너의 남성 헤어커트", price: 18000, duration: 40 },
  { name: "염색", desc: "프리미엄 염색 시술", price: 80000, duration: 120 },
  { name: "펌", desc: "볼륨매직, 셋팅펌 등", price: 120000, duration: 180 },
  { name: "클리닉", desc: "손상된 모발 클리닉 트리트먼트", price: 50000, duration: 60 },
  { name: "스타일링", desc: "특별한 날을 위한 스타일링", price: 30000, duration: 40 },
  { name: "매직스트레이트", desc: "찰랑찰랑 매직 스트레이트", price: 200000, duration: 240 },
  { name: "뿌리염색", desc: "뿌리 염색 리터치", price: 40000, duration: 60 },
  { name: "드라이", desc: "샴푸와 드라이", price: 15000, duration: 30 },
  { name: "업스타일", desc: "파티 및 행사용 업스타일", price: 60000, duration: 90 }
]

# Beauty shop services
beauty_services = [
  { name: "젤네일", desc: "젤네일 아트 시술", price: 50000, duration: 90 },
  { name: "패디큐어", desc: "발톱 관리 및 아트", price: 40000, duration: 60 },
  { name: "속눈썹연장", desc: "자연스러운 속눈썹 연장", price: 60000, duration: 90 },
  { name: "왁싱(전신)", desc: "전신 왁싱 관리", price: 150000, duration: 120 },
  { name: "페이셜케어", desc: "기본 피부 관리", price: 80000, duration: 60 },
  { name: "아쿠아필링", desc: "딥클렌징 아쿠아필링", price: 100000, duration: 90 },
  { name: "눈썹정리", desc: "눈썹 왁싱 및 정리", price: 15000, duration: 30 },
  { name: "반영구화장", desc: "자연스러운 반영구 메이크업", price: 300000, duration: 180 },
  { name: "네일아트", desc: "프리미엄 네일아트", price: 70000, duration: 120 },
  { name: "각질제거", desc: "각질제거 및 보습관리", price: 45000, duration: 60 }
]

# Gym services
gym_services = [
  { name: "1개월 이용권", desc: "헬스장 1개월 자유이용", price: 70000, duration: 30 },
  { name: "3개월 이용권", desc: "헬스장 3개월 자유이용", price: 180000, duration: 30 },
  { name: "6개월 이용권", desc: "헬스장 6개월 자유이용", price: 300000, duration: 30 },
  { name: "1년 이용권", desc: "헬스장 1년 자유이용", price: 500000, duration: 30 },
  { name: "PT 10회", desc: "1:1 퍼스널 트레이닝 10회", price: 500000, duration: 60 },
  { name: "PT 20회", desc: "1:1 퍼스널 트레이닝 20회", price: 900000, duration: 60 },
  { name: "PT 30회", desc: "1:1 퍼스널 트레이닝 30회", price: 1200000, duration: 60 },
  { name: "그룹PT", desc: "소그룹 트레이닝 (4-6명)", price: 300000, duration: 60 },
  { name: "필라테스", desc: "그룹 필라테스 클래스", price: 150000, duration: 50 },
  { name: "요가", desc: "그룹 요가 클래스", price: 120000, duration: 50 }
]

# Pilates services
pilates_services = [
  { name: "그룹레슨", desc: "소그룹 필라테스 클래스", price: 40000, duration: 50 },
  { name: "개인레슨", desc: "1:1 필라테스 개인레슨", price: 80000, duration: 50 },
  { name: "듀엣레슨", desc: "2:1 필라테스 레슨", price: 60000, duration: 50 },
  { name: "체험레슨", desc: "필라테스 1회 체험", price: 30000, duration: 50 },
  { name: "월 무제한", desc: "한달 무제한 그룹레슨", price: 300000, duration: 50 },
  { name: "10회권", desc: "그룹레슨 10회 패키지", price: 350000, duration: 50 },
  { name: "20회권", desc: "그룹레슨 20회 패키지", price: 650000, duration: 50 },
  { name: "30회권", desc: "그룹레슨 30회 패키지", price: 900000, duration: 50 },
  { name: "리포머", desc: "리포머 기구 필라테스", price: 90000, duration: 50 },
  { name: "캐딜락", desc: "캐딜락 기구 필라테스", price: 100000, duration: 50 }
]

shops.each do |shop|
  services = case shop.category
  when "hair_salon" then hair_services
  when "beauty_shop" then beauty_services
  when "gym" then gym_services
  when "pilates" then pilates_services
  end
  
  services.each do |service|
    Service.create!(
      shop: shop,
      name: service[:name],
      description: service[:desc],
      price: service[:price],
      duration: service[:duration]
    )
  end
end

# 4. Create Stylists/Trainers (800+)
puts "👨‍🎨 Creating stylists/trainers..."

# Name pools
female_names = ["김지은", "이서연", "박민지", "최수진", "정하은", "강예원", "조은비", "윤서영", "장미래", "임소정",
               "한지혜", "오혜진", "서유진", "신보라", "송민아", "권나영", "황수빈", "안소희", "배주희", "문채원",
               "나윤아", "고은별", "진달래", "하늘이", "백설아", "류다은", "남궁진", "독고은", "제갈린", "선우미",
               "김가은", "이나라", "박세라", "최미나", "정수아", "김세연", "이보람", "박소영", "최하린", "정민서"]

male_names = ["김준호", "이민수", "박지훈", "최동욱", "정우진", "강태양", "조현우", "윤재혁", "장민기", "임성준",
             "한도윤", "오승민", "서준영", "신동훈", "송재원", "권상우", "황정민", "안재홍", "배성우", "문빈",
             "김강민", "이준혁", "박성호", "최민규", "정태현", "강동원", "조인성", "윤상혁", "장동건", "임창정"]

shops.each_with_index do |shop, shop_index|
  stylist_count = case shop.category
  when "hair_salon" then 3
  when "beauty_shop" then 2
  when "gym" then 2
  when "pilates" then 2
  end
  
  stylist_count.times do |i|
    name = case shop.category
    when "hair_salon", "pilates"
      (i == 0 && shop_index % 3 == 0) ? male_names.sample : female_names.sample
    when "beauty_shop"
      female_names.sample
    when "gym"
      i == 0 ? male_names.sample : [male_names.sample, female_names.sample].sample
    end
    
    specialty = case shop.category
    when "hair_salon"
      ["커트 & 스타일링", "염색 & 탈색", "펌 & 클리닉", "남성 커트", "웨딩 헤어", "업스타일"].sample
    when "beauty_shop"
      ["젤네일 아트", "속눈썹 연장", "왁싱", "피부관리", "네일케어", "반영구화장"].sample
    when "gym"
      ["웨이트 트레이닝", "크로스핏", "재활 운동", "다이어트", "바디빌딩", "파워리프팅"].sample
    when "pilates"
      ["매트 필라테스", "기구 필라테스", "재활 필라테스", "산전/산후", "체형교정", "코어 강화"].sample
    end
    
    experience = rand(2..15)
    rating = (3.5 + rand * 1.5).round(1)
    
    bio = case shop.category
    when "hair_salon"
      title = ["디자이너", "실장", "원장"].sample
      "#{title}으로 근무중이며, #{experience}년 경력의 #{specialty} 전문가입니다. 고객 맞춤형 상담으로 최적의 스타일을 제안해드립니다."
    when "beauty_shop"
      "뷰티 전문가로 #{experience}년 경력을 보유하고 있습니다. #{specialty} 분야의 전문가로 최신 트렌드를 반영한 시술을 제공합니다."
    when "gym"
      "피트니스 전문 트레이너로 #{experience}년간 활동중입니다. #{specialty} 전문가로 체계적인 운동 프로그램을 제공합니다."
    when "pilates"
      "필라테스 전문 강사로 #{experience}년째 활동중입니다. #{specialty} 전문가로 개인별 맞춤 프로그램을 제공합니다."
    end
    
    gender = female_names.include?(name) ? 'women' : 'men'
    image_num = rand(1..50)
    
    Stylist.create!(
      shop: shop,
      name: name,
      specialty: specialty,
      experience_years: experience,
      rating: rating,
      bio: bio,
      image_url: "https://randomuser.me/api/portraits/#{gender}/#{image_num}.jpg"
    )
  end
end

# 5. Create Bookings
puts "📅 Creating bookings..."

200.times do
  user = users.select { |u| u.role == "customer" }.sample
  stylist = Stylist.all.sample
  service = stylist.shop.services.sample
  
  booking_date = Date.today + rand(-30..60).days
  booking_time = ["09:00", "10:00", "11:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00"].sample
  
  status = rand < 0.6 ? "confirmed" : (rand < 0.8 ? "pending" : "cancelled")
  
  Booking.create!(
    user: user,
    shop: stylist.shop,
    service: service,
    stylist: stylist,
    booking_date: booking_date,
    booking_time: booking_time,
    status: status,
    total_price: service.price
  )
end

# 6. Create Time Slots
puts "⏰ Creating time slots..."

# Create time slots for random stylists for the next 14 days
Stylist.all.sample(200).each do |stylist|
  (0..14).each do |day_offset|
    date = Date.today + day_offset
    
    ["09:00", "10:00", "11:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00"].each do |start_time|
      next if rand > 0.7  # Skip some slots randomly
      
      end_time = Time.parse(start_time) + 1.hour
      is_available = rand > 0.3
      
      TimeSlot.create!(
        stylist: stylist,
        date: date,
        start_time: start_time,
        end_time: end_time.strftime("%H:%M"),
        is_available: is_available
      )
    end
  end
end

# Print summary
end_time = Time.now
puts "\n✅ Data generation complete!"
puts "⏱️  Time taken: #{(end_time - start_time).round(2)} seconds"
puts "\n📊 Summary:"
puts "- Users: #{User.count}"
puts "- Shops: #{Shop.count}"
puts "- Services: #{Service.count}"
puts "- Stylists: #{Stylist.count}"
puts "- Bookings: #{Booking.count}"
puts "- Time Slots: #{TimeSlot.count}"