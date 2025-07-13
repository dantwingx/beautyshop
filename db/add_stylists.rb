puts "디자이너 데이터 추가 중..."

# 헤어샵과 뷰티샵에만 디자이너 추가
hair_beauty_shops = Shop.where(category: ['hair_salon', 'beauty_shop'])

hair_beauty_shops.each do |shop|
  next if shop.stylists.exists?
  
  # 매장당 2-4명의 디자이너 추가
  stylist_count = rand(2..4)
  
  stylist_count.times do |i|
    if shop.hair_salon?
      names = ['김민준', '이서윤', '박지호', '최예린', '정태현', '한소영']
      specialties = ['커트', '염색', '펌', '매직스트레이트', '남성컷', '웨딩헤어']
    else # beauty_shop
      names = ['이유진', '김나래', '박서현', '최민아', '정하은', '손지아']
      specialties = ['네일아트', '속눈썹연장', '피부관리', '왁싱', '반영구화장', '메이크업']
    end
    
    name = names[i % names.length]
    specialty = specialties[i % specialties.length]
    
    # 이미지 URL 생성 (실제로는 프로필 사진)
    gender = ['male', 'female'].sample
    image_url = "https://randomuser.me/api/portraits/#{gender}/#{rand(1..99)}.jpg"
    
    stylist = shop.stylists.create!(
      name: name,
      specialty: specialty,
      experience_years: rand(1..15),
      rating: (3.5 + rand * 1.5).round(1), # 3.5-5.0
      image_url: image_url,
      bio: "#{specialty} 전문 #{name}입니다. #{rand(1..15)}년의 경험으로 고객님께 최상의 서비스를 제공합니다."
    )
    
    # 향후 7일간의 타임슬롯 생성
    (0..6).each do |day|
      date = Date.current + day.days
      stylist.generate_time_slots_for_date(date)
    end
  end
end

puts "디자이너 데이터 추가 완료!"
puts "총 디자이너 수: #{Stylist.count}"
puts "총 타임슬롯 수: #{TimeSlot.count}"