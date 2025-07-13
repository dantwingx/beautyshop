# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Users
user1 = User.create!(
  email: "customer@example.com",
  password: "password123",
  name: "김고객",
  phone: "010-1234-5678",
  role: "customer"
)

user2 = User.create!(
  email: "owner@example.com", 
  password: "password123",
  name: "박사장",
  phone: "010-8765-4321",
  role: "shop_owner"
)

# Hair Salons
shop1 = Shop.create!(
  name: "로레알 헤어살롱",
  description: "프리미엄 헤어 스타일링 전문샵",
  address: "서울특별시 강남구 역삼동 123-45",
  phone: "02-1234-5678",
  category: "hair_salon",
  opening_hours: {
    monday: "10:00-20:00",
    tuesday: "10:00-20:00",
    wednesday: "10:00-20:00",
    thursday: "10:00-20:00",
    friday: "10:00-20:00",
    saturday: "10:00-18:00",
    sunday: "휴무"
  }
)

shop2 = Shop.create!(
  name: "뷰티플 네일&스킨",
  description: "네일아트와 피부관리 전문",
  address: "서울특별시 서초구 서초동 789-12",
  phone: "02-2345-6789",
  category: "beauty_shop",
  opening_hours: {
    monday: "11:00-21:00",
    tuesday: "11:00-21:00",
    wednesday: "11:00-21:00",
    thursday: "11:00-21:00",
    friday: "11:00-21:00",
    saturday: "11:00-19:00",
    sunday: "12:00-18:00"
  }
)

shop3 = Shop.create!(
  name: "파워짐 피트니스",
  description: "최신 운동기구를 갖춘 헬스장",
  address: "서울특별시 송파구 잠실동 456-78",
  phone: "02-3456-7890",
  category: "gym",
  opening_hours: {
    monday: "06:00-23:00",
    tuesday: "06:00-23:00",
    wednesday: "06:00-23:00",
    thursday: "06:00-23:00",
    friday: "06:00-23:00",
    saturday: "08:00-20:00",
    sunday: "08:00-20:00"
  }
)

shop4 = Shop.create!(
  name: "바디라인 필라테스",
  description: "전문 강사와 함께하는 필라테스 스튜디오",
  address: "서울특별시 마포구 연남동 234-56",
  phone: "02-4567-8901",
  category: "pilates",
  opening_hours: {
    monday: "07:00-21:00",
    tuesday: "07:00-21:00",
    wednesday: "07:00-21:00",
    thursday: "07:00-21:00",
    friday: "07:00-21:00",
    saturday: "09:00-18:00",
    sunday: "10:00-17:00"
  }
)

# Services for Hair Salon
Service.create!(
  shop: shop1,
  name: "커트",
  description: "전문 디자이너의 헤어커트",
  price: 35000,
  duration: 60
)

Service.create!(
  shop: shop1,
  name: "펌",
  description: "볼륨매직, 셋팅펌 등",
  price: 120000,
  duration: 180
)

Service.create!(
  shop: shop1,
  name: "염색",
  description: "올 컬러, 하이라이트 염색",
  price: 80000,
  duration: 120
)

# Services for Beauty Shop
Service.create!(
  shop: shop2,
  name: "젤네일",
  description: "젤네일 아트 시술",
  price: 50000,
  duration: 90
)

Service.create!(
  shop: shop2,
  name: "페이셜 케어",
  description: "기본 피부 관리",
  price: 80000,
  duration: 60
)

# Services for Gym
Service.create!(
  shop: shop3,
  name: "1개월 이용권",
  description: "헬스장 1개월 자유이용",
  price: 70000,
  duration: 30
)

Service.create!(
  shop: shop3,
  name: "PT 10회",
  description: "1:1 퍼스널 트레이닝 10회",
  price: 500000,
  duration: 60
)

# Services for Pilates
Service.create!(
  shop: shop4,
  name: "그룹 레슨",
  description: "소그룹 필라테스 클래스",
  price: 40000,
  duration: 50
)

Service.create!(
  shop: shop4,
  name: "개인 레슨",
  description: "1:1 필라테스 개인레슨",
  price: 80000,
  duration: 50
)

puts "Seed data created successfully!"
puts "Created #{User.count} users"
puts "Created #{Shop.count} shops"
puts "Created #{Service.count} services"