-- Insert sample users
INSERT INTO users (email, password_digest, name, phone, role, created_at, updated_at) VALUES
('customer1@example.com', '$2a$12$K8eDicpf3lhY.Y8KhUyUCOL9T0q5m0G/9vM.fQ3qXBH8mDq6UaRoW', '김민수', '010-1234-5678', 0, NOW(), NOW()),
('customer2@example.com', '$2a$12$K8eDicpf3lhY.Y8KhUyUCOL9T0q5m0G/9vM.fQ3qXBH8mDq6UaRoW', '이서연', '010-2345-6789', 0, NOW(), NOW()),
('customer3@example.com', '$2a$12$K8eDicpf3lhY.Y8KhUyUCOL9T0q5m0G/9vM.fQ3qXBH8mDq6UaRoW', '박지훈', '010-3456-7890', 0, NOW(), NOW()),
('customer4@example.com', '$2a$12$K8eDicpf3lhY.Y8KhUyUCOL9T0q5m0G/9vM.fQ3qXBH8mDq6UaRoW', '최유진', '010-4567-8901', 0, NOW(), NOW()),
('customer5@example.com', '$2a$12$K8eDicpf3lhY.Y8KhUyUCOL9T0q5m0G/9vM.fQ3qXBH8mDq6UaRoW', '정하늘', '010-5678-9012', 0, NOW(), NOW()),
('owner1@example.com', '$2a$12$K8eDicpf3lhY.Y8KhUyUCOL9T0q5m0G/9vM.fQ3qXBH8mDq6UaRoW', '김사장', '010-9999-1111', 1, NOW(), NOW()),
('owner2@example.com', '$2a$12$K8eDicpf3lhY.Y8KhUyUCOL9T0q5m0G/9vM.fQ3qXBH8mDq6UaRoW', '이대표', '010-9999-2222', 1, NOW(), NOW());

-- Insert hair salons (100 shops)
INSERT INTO shops (name, description, address, latitude, longitude, phone, category, opening_hours, image_url, created_at, updated_at) 
SELECT 
    CONCAT(hair_prefix, ' ', hair_suffix) as name,
    CONCAT('프리미엄 ', hair_prefix, ' ', hair_suffix, '입니다. 최고의 헤어 디자이너들이 당신의 스타일을 완성합니다.') as description,
    CONCAT('서울특별시 ', district, ' ', street, ' ', building_num) as address,
    base_lat + (RANDOM() - 0.5) * 0.02 as latitude,
    base_lng + (RANDOM() - 0.5) * 0.02 as longitude,
    CONCAT('02-', LPAD(FLOOR(RANDOM() * 9000 + 1000)::text, 4, '0'), '-', LPAD(FLOOR(RANDOM() * 9000 + 1000)::text, 4, '0')) as phone,
    0 as category,
    '{"monday": "10:00-20:00", "tuesday": "10:00-20:00", "wednesday": "10:00-20:00", "thursday": "10:00-20:00", "friday": "10:00-21:00", "saturday": "10:00-19:00", "sunday": "휴무"}'::jsonb,
    CONCAT('https://picsum.photos/400/300?random=', seq) as image_url,
    NOW(),
    NOW()
FROM (
    SELECT 
        hair_prefix,
        hair_suffix,
        district,
        base_lat,
        base_lng,
        street,
        building_num,
        seq
    FROM 
        (VALUES 
            ('로레알'), ('준오'), ('리안'), ('박승철'), ('이철'), 
            ('청담'), ('압구정'), ('차홍'), ('고운'), ('미용실')
        ) AS hp(hair_prefix),
        (VALUES 
            ('헤어'), ('살롱'), ('헤어샵'), ('헤어스튜디오'), ('뷰티살롱'), 
            ('헤어부티크'), ('헤어갤러리'), ('스타일'), ('헤어모드'), ('헤어라운지')
        ) AS hs(hair_suffix),
        (VALUES 
            ('강남구', 37.5172, 127.0473), ('서초구', 37.4837, 127.0324),
            ('송파구', 37.5145, 127.1066), ('마포구', 37.5663, 126.9019),
            ('용산구', 37.5384, 126.9654), ('성동구', 37.5633, 127.0371),
            ('광진구', 37.5385, 127.0823), ('동작구', 37.5124, 126.9394),
            ('종로구', 37.5735, 126.9790), ('중구', 37.5641, 126.9979)
        ) AS d(district, base_lat, base_lng),
        (VALUES 
            ('테헤란로'), ('강남대로'), ('봉은사로'), ('언주로'), ('삼성로'),
            ('도산대로'), ('학동로'), ('역삼로'), ('선릉로'), ('논현로')
        ) AS s(street),
        (VALUES 
            ('123-45'), ('234-56'), ('345-67'), ('456-78'), ('567-89'),
            ('678-90'), ('789-01'), ('890-12'), ('901-23'), ('012-34')
        ) AS b(building_num),
        generate_series(1, 100) AS seq
    ORDER BY RANDOM()
    LIMIT 100
) AS shop_data;

-- Insert beauty shops (100 shops)
INSERT INTO shops (name, description, address, latitude, longitude, phone, category, opening_hours, image_url, created_at, updated_at) 
SELECT 
    CONCAT(beauty_prefix, ' ', beauty_suffix) as name,
    CONCAT('전문 ', beauty_prefix, ' ', beauty_suffix, '입니다. 아름다움을 위한 토탈 뷰티케어를 제공합니다.') as description,
    CONCAT('서울특별시 ', district, ' ', street, ' ', building_num) as address,
    base_lat + (RANDOM() - 0.5) * 0.02 as latitude,
    base_lng + (RANDOM() - 0.5) * 0.02 as longitude,
    CONCAT('02-', LPAD(FLOOR(RANDOM() * 9000 + 1000)::text, 4, '0'), '-', LPAD(FLOOR(RANDOM() * 9000 + 1000)::text, 4, '0')) as phone,
    1 as category,
    '{"monday": "11:00-21:00", "tuesday": "11:00-21:00", "wednesday": "11:00-21:00", "thursday": "11:00-21:00", "friday": "11:00-22:00", "saturday": "10:00-20:00", "sunday": "10:00-19:00"}'::jsonb,
    CONCAT('https://picsum.photos/400/300?random=', seq + 100) as image_url,
    NOW(),
    NOW()
FROM (
    SELECT 
        beauty_prefix,
        beauty_suffix,
        district,
        base_lat,
        base_lng,
        street,
        building_num,
        seq
    FROM 
        (VALUES 
            ('더퀸'), ('네일'), ('뷰티'), ('에스테틱'), ('스킨'), 
            ('페이셜'), ('왁싱'), ('속눈썹'), ('아름'), ('미인')
        ) AS bp(beauty_prefix),
        (VALUES 
            ('네일'), ('스파'), ('에스테틱'), ('뷰티'), ('케어'), 
            ('클리닉'), ('살롱'), ('스튜디오'), ('부티크'), ('갤러리')
        ) AS bs(beauty_suffix),
        (VALUES 
            ('강남구', 37.5172, 127.0473), ('서초구', 37.4837, 127.0324),
            ('송파구', 37.5145, 127.1066), ('마포구', 37.5663, 126.9019),
            ('용산구', 37.5384, 126.9654), ('성동구', 37.5633, 127.0371),
            ('광진구', 37.5385, 127.0823), ('동작구', 37.5124, 126.9394),
            ('종로구', 37.5735, 126.9790), ('중구', 37.5641, 126.9979)
        ) AS d(district, base_lat, base_lng),
        (VALUES 
            ('강남대로'), ('테헤란로'), ('신사로'), ('압구정로'), ('청담동길'),
            ('도산대로'), ('봉은사로'), ('삼성로'), ('선릉로'), ('역삼로')
        ) AS s(street),
        (VALUES 
            ('111-22'), ('222-33'), ('333-44'), ('444-55'), ('555-66'),
            ('666-77'), ('777-88'), ('888-99'), ('999-00'), ('000-11')
        ) AS b(building_num),
        generate_series(1, 100) AS seq
    ORDER BY RANDOM()
    LIMIT 100
) AS shop_data;

-- Insert gyms (100 shops)
INSERT INTO shops (name, description, address, latitude, longitude, phone, category, opening_hours, image_url, created_at, updated_at) 
SELECT 
    CONCAT(gym_prefix, ' ', gym_suffix) as name,
    CONCAT('최신 운동기구를 갖춘 ', gym_prefix, ' ', gym_suffix, '입니다. 전문 트레이너와 함께 건강한 몸을 만드세요.') as description,
    CONCAT('서울특별시 ', district, ' ', street, ' ', building_num) as address,
    base_lat + (RANDOM() - 0.5) * 0.02 as latitude,
    base_lng + (RANDOM() - 0.5) * 0.02 as longitude,
    CONCAT('02-', LPAD(FLOOR(RANDOM() * 9000 + 1000)::text, 4, '0'), '-', LPAD(FLOOR(RANDOM() * 9000 + 1000)::text, 4, '0')) as phone,
    2 as category,
    '{"monday": "06:00-23:00", "tuesday": "06:00-23:00", "wednesday": "06:00-23:00", "thursday": "06:00-23:00", "friday": "06:00-23:00", "saturday": "08:00-21:00", "sunday": "08:00-20:00"}'::jsonb,
    CONCAT('https://picsum.photos/400/300?random=', seq + 200) as image_url,
    NOW(),
    NOW()
FROM (
    SELECT 
        gym_prefix,
        gym_suffix,
        district,
        base_lat,
        base_lng,
        street,
        building_num,
        seq
    FROM 
        (VALUES 
            ('파워'), ('스트롱'), ('머슬'), ('휘트니스'), ('바디'), 
            ('피지컬'), ('애니타임'), ('크로스핏'), ('운동'), ('헬스')
        ) AS gp(gym_prefix),
        (VALUES 
            ('짐'), ('피트니스'), ('휘트니스'), ('헬스클럽'), ('스포츠센터'), 
            ('트레이닝센터'), ('헬스장'), ('웰니스'), ('스포츠'), ('클럽')
        ) AS gs(gym_suffix),
        (VALUES 
            ('강남구', 37.5172, 127.0473), ('서초구', 37.4837, 127.0324),
            ('송파구', 37.5145, 127.1066), ('마포구', 37.5663, 126.9019),
            ('용산구', 37.5384, 126.9654), ('성동구', 37.5633, 127.0371),
            ('광진구', 37.5385, 127.0823), ('동작구', 37.5124, 126.9394),
            ('종로구', 37.5735, 126.9790), ('중구', 37.5641, 126.9979)
        ) AS d(district, base_lat, base_lng),
        (VALUES 
            ('올림픽로'), ('강남대로'), ('테헤란로'), ('삼성로'), ('봉은사로'),
            ('언주로'), ('도곡로'), ('대치동길'), ('역삼로'), ('선릉로')
        ) AS s(street),
        (VALUES 
            ('100-11'), ('200-22'), ('300-33'), ('400-44'), ('500-55'),
            ('600-66'), ('700-77'), ('800-88'), ('900-99'), ('050-60')
        ) AS b(building_num),
        generate_series(1, 100) AS seq
    ORDER BY RANDOM()
    LIMIT 100
) AS shop_data;

-- Insert pilates studios (100 shops)
INSERT INTO shops (name, description, address, latitude, longitude, phone, category, opening_hours, image_url, created_at, updated_at) 
SELECT 
    CONCAT(pilates_prefix, ' ', pilates_suffix) as name,
    CONCAT('전문 강사진과 함께하는 ', pilates_prefix, ' ', pilates_suffix, '입니다. 체계적인 프로그램으로 건강한 몸을 만들어드립니다.') as description,
    CONCAT('서울특별시 ', district, ' ', street, ' ', building_num) as address,
    base_lat + (RANDOM() - 0.5) * 0.02 as latitude,
    base_lng + (RANDOM() - 0.5) * 0.02 as longitude,
    CONCAT('02-', LPAD(FLOOR(RANDOM() * 9000 + 1000)::text, 4, '0'), '-', LPAD(FLOOR(RANDOM() * 9000 + 1000)::text, 4, '0')) as phone,
    3 as category,
    '{"monday": "07:00-21:00", "tuesday": "07:00-21:00", "wednesday": "07:00-21:00", "thursday": "07:00-21:00", "friday": "07:00-21:00", "saturday": "09:00-18:00", "sunday": "10:00-17:00"}'::jsonb,
    CONCAT('https://picsum.photos/400/300?random=', seq + 300) as image_url,
    NOW(),
    NOW()
FROM (
    SELECT 
        pilates_prefix,
        pilates_suffix,
        district,
        base_lat,
        base_lng,
        street,
        building_num,
        seq
    FROM 
        (VALUES 
            ('바디'), ('코어'), ('리폼'), ('클래식'), ('모던'), 
            ('파워'), ('프리미엄'), ('더'), ('필라'), ('요가')
        ) AS pp(pilates_prefix),
        (VALUES 
            ('필라테스'), ('필라테스스튜디오'), ('무브먼트'), ('바디워크'), ('스튜디오'), 
            ('센터'), ('필라테스센터'), ('웰니스'), ('밸런스'), ('코어')
        ) AS ps(pilates_suffix),
        (VALUES 
            ('강남구', 37.5172, 127.0473), ('서초구', 37.4837, 127.0324),
            ('송파구', 37.5145, 127.1066), ('마포구', 37.5663, 126.9019),
            ('용산구', 37.5384, 126.9654), ('성동구', 37.5633, 127.0371),
            ('광진구', 37.5385, 127.0823), ('동작구', 37.5124, 126.9394),
            ('종로구', 37.5735, 126.9790), ('중구', 37.5641, 126.9979)
        ) AS d(district, base_lat, base_lng),
        (VALUES 
            ('강남대로'), ('논현로'), ('도산대로'), ('압구정로'), ('청담동길'),
            ('삼성로'), ('선릉로'), ('역삼로'), ('테헤란로'), ('봉은사로')
        ) AS s(street),
        (VALUES 
            ('101-11'), ('202-22'), ('303-33'), ('404-44'), ('505-55'),
            ('606-66'), ('707-77'), ('808-88'), ('909-99'), ('010-10')
        ) AS b(building_num),
        generate_series(1, 100) AS seq
    ORDER BY RANDOM()
    LIMIT 100
) AS shop_data;

-- Now we need to get the shop IDs that were just inserted
-- Insert services for all shops
INSERT INTO services (shop_id, name, description, price, duration, created_at, updated_at)
SELECT 
    s.id,
    service_data.name,
    service_data.description,
    service_data.price,
    service_data.duration,
    NOW(),
    NOW()
FROM shops s
CROSS JOIN LATERAL (
    SELECT * FROM (
        VALUES 
            -- Hair salon services
            ('여성커트', '전문 디자이너의 여성 헤어커트', 25000, 60),
            ('남성커트', '전문 디자이너의 남성 헤어커트', 18000, 40),
            ('염색', '프리미엄 염색 시술', 80000, 120),
            ('펌', '볼륨매직, 셋팅펌 등', 120000, 180),
            ('클리닉', '손상된 모발 클리닉 트리트먼트', 50000, 60)
    ) AS services(name, description, price, duration)
    WHERE s.category = 0
    
    UNION ALL
    
    SELECT * FROM (
        VALUES
            -- Beauty shop services
            ('젤네일', '젤네일 아트 시술', 50000, 90),
            ('패디큐어', '발톱 관리 및 아트', 40000, 60),
            ('속눈썹연장', '자연스러운 속눈썹 연장', 60000, 90),
            ('왁싱(전신)', '전신 왁싱 관리', 150000, 120),
            ('페이셜케어', '기본 피부 관리', 80000, 60)
    ) AS services(name, description, price, duration)
    WHERE s.category = 1
    
    UNION ALL
    
    SELECT * FROM (
        VALUES
            -- Gym services
            ('1개월 이용권', '헬스장 1개월 자유이용', 70000, 30),
            ('3개월 이용권', '헬스장 3개월 자유이용', 180000, 30),
            ('PT 10회', '1:1 퍼스널 트레이닝 10회', 500000, 60),
            ('PT 20회', '1:1 퍼스널 트레이닝 20회', 900000, 60),
            ('그룹PT', '소그룹 트레이닝 (4-6명)', 300000, 60)
    ) AS services(name, description, price, duration)
    WHERE s.category = 2
    
    UNION ALL
    
    SELECT * FROM (
        VALUES
            -- Pilates services
            ('그룹레슨', '소그룹 필라테스 클래스', 40000, 50),
            ('개인레슨', '1:1 필라테스 개인레슨', 80000, 50),
            ('듀엣레슨', '2:1 필라테스 레슨', 60000, 50),
            ('체험레슨', '필라테스 1회 체험', 30000, 50),
            ('월 무제한', '한달 무제한 그룹레슨', 300000, 50)
    ) AS services(name, description, price, duration)
    WHERE s.category = 3
) AS service_data;

-- Insert stylists for hair salons and beauty shops
INSERT INTO stylists (shop_id, name, specialty, experience_years, rating, bio, image_url, created_at, updated_at)
SELECT 
    s.id,
    stylist_data.name,
    stylist_data.specialty,
    stylist_data.experience_years,
    stylist_data.rating,
    stylist_data.bio,
    CONCAT('https://i.pravatar.cc/300?img=', stylist_data.avatar_id) as image_url,
    NOW(),
    NOW()
FROM shops s
CROSS JOIN LATERAL (
    SELECT 
        names.name,
        CASE 
            WHEN s.category = 0 THEN specialties_hair.specialty
            WHEN s.category = 1 THEN specialties_beauty.specialty
            WHEN s.category = 2 THEN specialties_gym.specialty
            ELSE specialties_pilates.specialty
        END as specialty,
        FLOOR(RANDOM() * 15 + 3) as experience_years,
        ROUND((RANDOM() * 2 + 3)::numeric, 1) as rating,
        CASE 
            WHEN s.category = 0 THEN CONCAT(names.name, ' 디자이너는 ', FLOOR(RANDOM() * 15 + 3), '년 경력의 헤어 전문가입니다.')
            WHEN s.category = 1 THEN CONCAT(names.name, ' 선생님은 ', FLOOR(RANDOM() * 15 + 3), '년 경력의 뷰티 전문가입니다.')
            WHEN s.category = 2 THEN CONCAT(names.name, ' 트레이너는 ', FLOOR(RANDOM() * 15 + 3), '년 경력의 피트니스 전문가입니다.')
            ELSE CONCAT(names.name, ' 강사님은 ', FLOOR(RANDOM() * 15 + 3), '년 경력의 필라테스 전문가입니다.')
        END as bio,
        FLOOR(RANDOM() * 70 + 1) as avatar_id
    FROM 
        (VALUES ('김지훈'), ('이서연'), ('박민수'), ('최유진'), ('정하늘')) AS names(name),
        (VALUES ('커트 전문'), ('염색 전문'), ('펌 전문'), ('스타일링 전문')) AS specialties_hair(specialty),
        (VALUES ('네일아트 전문'), ('속눈썹 전문'), ('왁싱 전문'), ('피부관리 전문')) AS specialties_beauty(specialty),
        (VALUES ('웨이트 전문'), ('크로스핏 전문'), ('재활운동 전문'), ('다이어트 전문')) AS specialties_gym(specialty),
        (VALUES ('재활 필라테스'), ('체형교정 전문'), ('산전/산후 전문'), ('그룹레슨 전문')) AS specialties_pilates(specialty)
    LIMIT 3
) AS stylist_data;

-- Insert sample bookings
INSERT INTO bookings (user_id, shop_id, service_id, stylist_id, booking_date, booking_time, status, total_price, created_at, updated_at)
SELECT 
    u.id as user_id,
    s.id as shop_id,
    srv.id as service_id,
    st.id as stylist_id,
    CURRENT_DATE + INTERVAL '1 day' * FLOOR(RANDOM() * 30) as booking_date,
    TIME '09:00:00' + INTERVAL '1 hour' * FLOOR(RANDOM() * 10) as booking_time,
    FLOOR(RANDOM() * 3) as status,
    srv.price as total_price,
    NOW(),
    NOW()
FROM 
    (SELECT id FROM users WHERE role = 0 LIMIT 5) u
    CROSS JOIN LATERAL (
        SELECT s.id, srv.id as service_id, srv.price
        FROM shops s
        JOIN services srv ON srv.shop_id = s.id
        ORDER BY RANDOM()
        LIMIT 20
    ) AS s(id, service_id, price)
    JOIN services srv ON srv.id = s.service_id
    LEFT JOIN stylists st ON st.shop_id = s.id
LIMIT 100;