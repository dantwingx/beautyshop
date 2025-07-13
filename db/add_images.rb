# 매장과 디자이너 이미지 추가 스크립트

# Unsplash API를 사용한 실제 이미지 URL들
# 이미지들은 Unsplash의 무료 이미지를 사용합니다

# 헤어샵 이미지들
hair_salon_images = [
  # 모던한 헤어샵 인테리어
  "https://images.unsplash.com/photo-1560066984-138dadb4c035?w=800&q=80",
  "https://images.unsplash.com/photo-1522337094846-8a818192de1f?w=800&q=80",
  "https://images.unsplash.com/photo-1559599101-f09722fb4948?w=800&q=80",
  "https://images.unsplash.com/photo-1562322140-8baeececf3df?w=800&q=80",
  "https://images.unsplash.com/photo-1633681926022-84c23e8cb2d6?w=800&q=80",
  
  # 헤어 시술 장면
  "https://images.unsplash.com/photo-1582095133179-bfd08e2fc6b3?w=800&q=80",
  "https://images.unsplash.com/photo-1595476193106-b76d75e01ec5?w=800&q=80",
  "https://images.unsplash.com/photo-1620331311520-246422fd82f9?w=800&q=80",
  "https://images.unsplash.com/photo-1605497788044-5a32c7078486?w=800&q=80",
  "https://images.unsplash.com/photo-1599351431613-18ef1fdd27e3?w=800&q=80"
]

# 뷰티샵/네일샵 이미지들
beauty_shop_images = [
  # 네일아트
  "https://images.unsplash.com/photo-1604654894610-df63bc536371?w=800&q=80",
  "https://images.unsplash.com/photo-1632345031435-8727f6897d53?w=800&q=80",
  "https://images.unsplash.com/photo-1610992015732-2449b76344bc?w=800&q=80",
  
  # 뷰티샵 인테리어
  "https://images.unsplash.com/photo-1560750588-73207b1ef5b8?w=800&q=80",
  "https://images.unsplash.com/photo-1629380087706-94d2b3e9fd5f?w=800&q=80",
  
  # 메이크업/속눈썹
  "https://images.unsplash.com/photo-1487412947147-5cebf100ffc2?w=800&q=80",
  "https://images.unsplash.com/photo-1516914943479-89db7d9ae7f2?w=800&q=80",
  "https://images.unsplash.com/photo-1583241801057-5aeb07579455?w=800&q=80"
]

# 헬스장 이미지들
gym_images = [
  "https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=800&q=80",
  "https://images.unsplash.com/photo-1593079831268-3381b0db4a77?w=800&q=80",
  "https://images.unsplash.com/photo-1540497077202-7c8a3999166f?w=800&q=80",
  "https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=800&q=80",
  "https://images.unsplash.com/photo-1558611848-73f7eb4001a1?w=800&q=80"
]

# 필라테스 이미지들
pilates_images = [
  "https://images.unsplash.com/photo-1518611012118-696072aa579a?w=800&q=80",
  "https://images.unsplash.com/photo-1599901860904-17e6ed7083a0?w=800&q=80",
  "https://images.unsplash.com/photo-1540206063137-4a88ca974d1a?w=800&q=80",
  "https://images.unsplash.com/photo-1601422407692-ec4eeec1d9b3?w=800&q=80",
  "https://images.unsplash.com/photo-1594381898411-846e7d193883?w=800&q=80"
]

# 헤어 디자이너 프로필 이미지들
hair_stylist_images = [
  # 여성 헤어 디자이너
  "https://images.unsplash.com/photo-1595959292985-d4d4c0e2c985?w=400&q=80",
  "https://images.unsplash.com/photo-1580618672591-eb180b1a973f?w=400&q=80",
  "https://images.unsplash.com/photo-1562004127-c8395af35f17?w=400&q=80",
  "https://images.unsplash.com/photo-1559718062-361155fad299?w=400&q=80",
  
  # 남성 헤어 디자이너
  "https://images.unsplash.com/photo-1621605815971-fbc98d665033?w=400&q=80",
  "https://images.unsplash.com/photo-1578176603894-57973e38890f?w=400&q=80",
  "https://images.unsplash.com/photo-1622122201649-d4fb99d01e18?w=400&q=80"
]

# 뷰티 전문가 프로필 이미지들
beauty_specialist_images = [
  "https://images.unsplash.com/photo-1607746882042-944635dfe10e?w=400&q=80",
  "https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?w=400&q=80",
  "https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=400&q=80",
  "https://images.unsplash.com/photo-1582562124811-c09040d0a901?w=400&q=80",
  "https://images.unsplash.com/photo-1598257006463-48959f21c140?w=400&q=80"
]

puts "매장 이미지 업데이트 중..."

# 헤어샵 이미지 업데이트
Shop.where(category: 'hair_salon').each_with_index do |shop, index|
  selected_images = hair_salon_images.sample(4)
  shop.update!(image_urls: selected_images)
  print "."
end

# 뷰티샵 이미지 업데이트
Shop.where(category: 'beauty_shop').each_with_index do |shop, index|
  selected_images = beauty_shop_images.sample(3)
  shop.update!(image_urls: selected_images)
  print "."
end

# 헬스장 이미지 업데이트
Shop.where(category: 'gym').each_with_index do |shop, index|
  selected_images = gym_images.sample(3)
  shop.update!(image_urls: selected_images)
  print "."
end

# 필라테스 이미지 업데이트
Shop.where(category: 'pilates').each_with_index do |shop, index|
  selected_images = pilates_images.sample(3)
  shop.update!(image_urls: selected_images)
  print "."
end

puts "\n\n디자이너 프로필 이미지 업데이트 중..."

# 헤어샵 디자이너 이미지 업데이트
Shop.where(category: 'hair_salon').each do |shop|
  shop.stylists.each_with_index do |stylist, index|
    stylist.update!(image_url: hair_stylist_images.sample)
  end
  print "."
end

# 뷰티샵 디자이너 이미지 업데이트
Shop.where(category: 'beauty_shop').each do |shop|
  shop.stylists.each_with_index do |stylist, index|
    stylist.update!(image_url: beauty_specialist_images.sample)
  end
  print "."
end

puts "\n\n✅ 이미지 업데이트 완료!"
puts "- 매장 이미지: #{Shop.where.not(image_urls: []).count}개"
puts "- 디자이너 프로필: #{Stylist.where.not(image_url: nil).count}개"