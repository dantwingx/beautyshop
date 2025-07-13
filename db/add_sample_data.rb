# 샘플 데이터 추가
puts "샘플 데이터 추가 중..."

# 추가 매장들
hair_shops = [
  { name: "차홍헤어", category: "hair_salon", description: "트렌디한 헤어스타일링 전문" },
  { name: "정관장헤어샵", category: "hair_salon", description: "20년 경력의 실력있는 디자이너" },
  { name: "미용실 아름다운", category: "hair_salon", description: "여성 전용 프리미엄 헤어살롱" }
]

beauty_shops = [
  { name: "네일퀸", category: "beauty_shop", description: "아트네일 전문점" },
  { name: "더페이셜샵", category: "beauty_shop", description: "피부관리 전문" },
  { name: "뷰티플레이스", category: "beauty_shop", description: "토탈뷰티케어" }
]

gyms = [
  { name: "애니타임피트니스", category: "gym", description: "24시간 헬스장" },
  { name: "월드짐", category: "gym", description: "최신 운동기구 완비" },
  { name: "스마트피트", category: "gym", description: "개인별 맞춤 운동" }
]

pilates_studios = [
  { name: "더필라테스", category: "pilates", description: "소수정예 레슨" },
  { name: "코어필라테스", category: "pilates", description: "재활 전문" },
  { name: "바디앤소울", category: "pilates", description: "요가+필라테스" }
]

all_shops = hair_shops + beauty_shops + gyms + pilates_studios

all_shops.each_with_index do |shop_data, index|
  next if Shop.exists?(name: shop_data[:name])
  
  shop = Shop.create!(
    name: shop_data[:name],
    description: shop_data[:description],
    address: "서울특별시 강남구 역삼동 #{100 + index}",
    latitude: 37.5172 + (index * 0.001),
    longitude: 127.0473 + (index * 0.001),
    phone: "02-#{rand(100..999)}-#{rand(1000..9999)}",
    category: shop_data[:category],
    opening_hours: {
      "월요일" => "10:00-20:00",
      "화요일" => "10:00-20:00", 
      "수요일" => "10:00-20:00",
      "목요일" => "10:00-20:00",
      "금요일" => "10:00-20:00",
      "토요일" => "10:00-18:00",
      "일요일" => "휴무"
    }
  )
  
  # 서비스 추가
  case shop_data[:category]
  when "hair_salon"
    [
      { name: "여성커트", price: 30000, duration: 60 },
      { name: "남성커트", price: 20000, duration: 40 },
      { name: "염색", price: 90000, duration: 120 }
    ].each do |service_data|
      shop.services.create!(service_data.merge(description: "#{service_data[:name]} 전문 서비스"))
    end
  when "beauty_shop"
    [
      { name: "젤네일", price: 45000, duration: 90 },
      { name: "페이셜", price: 70000, duration: 60 },
      { name: "왁싱", price: 120000, duration: 90 }
    ].each do |service_data|
      shop.services.create!(service_data.merge(description: "#{service_data[:name]} 전문 서비스"))
    end
  when "gym"
    [
      { name: "1개월 이용권", price: 70000, duration: 30 },
      { name: "PT 10회", price: 500000, duration: 60 }
    ].each do |service_data|
      shop.services.create!(service_data.merge(description: "#{service_data[:name]} 이용권"))
    end
  when "pilates"
    [
      { name: "그룹레슨", price: 35000, duration: 50 },
      { name: "개인레슨", price: 70000, duration: 50 }
    ].each do |service_data|
      shop.services.create!(service_data.merge(description: "#{service_data[:name]} 수업"))
    end
  end
end

puts "샘플 데이터 추가 완료!"
puts "총 매장 수: #{Shop.count}"
puts "총 서비스 수: #{Service.count}"