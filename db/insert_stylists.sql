-- Insert stylists for ALL shops (3-5 stylists per shop)
-- This will create approximately 1200-2000 stylists total

INSERT INTO stylists (shop_id, name, specialty, experience_years, rating, bio, image_url, created_at, updated_at)
SELECT 
    shop_id,
    name,
    specialty,
    experience_years,
    rating,
    bio,
    image_url,
    NOW(),
    NOW()
FROM (
    -- Generate stylists for hair salons
    SELECT 
        s.id as shop_id,
        stylist_names.name,
        hair_specialties.specialty,
        FLOOR(RANDOM() * 15 + 2)::int as experience_years,
        (3.5 + RANDOM() * 1.5)::numeric(3,1) as rating,
        CONCAT(
            stylist_names.name, 
            CASE FLOOR(RANDOM() * 3)
                WHEN 0 THEN ' 디자이너는 '
                WHEN 1 THEN ' 원장님은 '
                ELSE ' 실장님은 '
            END,
            FLOOR(RANDOM() * 15 + 2)::text, 
            '년 경력의 ', 
            hair_specialties.specialty, 
            ' 전문가입니다. ',
            CASE FLOOR(RANDOM() * 5)
                WHEN 0 THEN '해외 연수 경험이 풍부하며 트렌디한 스타일을 추구합니다.'
                WHEN 1 THEN '고객 맞춤형 상담으로 최적의 스타일을 제안해드립니다.'
                WHEN 2 THEN '다양한 대회 수상 경력이 있는 실력파 디자이너입니다.'
                WHEN 3 THEN '세심한 손길과 정성으로 고객님을 케어해드립니다.'
                ELSE '최신 트렌드를 반영한 스타일링을 제공합니다.'
            END
        ) as bio,
        CONCAT('https://xsgames.co/randomusers/avatar.php?g=', 
            CASE WHEN stylist_names.gender = 'M' THEN 'male' ELSE 'female' END, 
            '&r=', FLOOR(RANDOM() * 1000000)::text
        ) as image_url
    FROM shops s
    CROSS JOIN (
        VALUES 
            -- Female stylists (70%)
            ('김지은', 'F'), ('이서연', 'F'), ('박민지', 'F'), ('최수진', 'F'), ('정하은', 'F'),
            ('강예원', 'F'), ('조은비', 'F'), ('윤서영', 'F'), ('장미래', 'F'), ('임소정', 'F'),
            ('한지혜', 'F'), ('오혜진', 'F'), ('서유진', 'F'), ('신보라', 'F'), ('송민아', 'F'),
            ('권나영', 'F'), ('황수빈', 'F'), ('안소희', 'F'), ('배주희', 'F'), ('문채원', 'F'),
            ('나윤아', 'F'), ('고은별', 'F'), ('진달래', 'F'), ('하늘이', 'F'), ('백설아', 'F'),
            ('류다은', 'F'), ('남궁진', 'F'), ('독고은', 'F'), ('제갈린', 'F'), ('선우미', 'F'),
            ('김가은', 'F'), ('이나라', 'F'), ('박세라', 'F'), ('최미나', 'F'), ('정수아', 'F'),
            -- Male stylists (30%)
            ('김준호', 'M'), ('이민수', 'M'), ('박지훈', 'M'), ('최동욱', 'M'), ('정우진', 'M'),
            ('강태양', 'M'), ('조현우', 'M'), ('윤재혁', 'M'), ('장민기', 'M'), ('임성준', 'M'),
            ('한도윤', 'M'), ('오승민', 'M'), ('서준영', 'M'), ('신동훈', 'M'), ('송재원', 'M')
    ) AS stylist_names(name, gender)
    CROSS JOIN (
        VALUES 
            ('커트 & 스타일링'), ('염색 & 탈색'), ('펌 & 클리닉'), 
            ('남성 커트'), ('웨딩 헤어'), ('업스타일'), 
            ('디지털 펌'), ('발레아쥬'), ('옴브레 염색'),
            ('볼륨매직'), ('열펌'), ('뿌리볼륨펌')
    ) AS hair_specialties(specialty)
    WHERE s.category = 0
    AND RANDOM() < 0.04  -- Each shop gets 3-5 stylists randomly

    UNION ALL

    -- Generate stylists for beauty shops
    SELECT 
        s.id as shop_id,
        stylist_names.name,
        beauty_specialties.specialty,
        FLOOR(RANDOM() * 12 + 1)::int as experience_years,
        (3.8 + RANDOM() * 1.2)::numeric(3,1) as rating,
        CONCAT(
            stylist_names.name, 
            ' 선생님은 ',
            FLOOR(RANDOM() * 12 + 1)::text, 
            '년 경력의 ', 
            beauty_specialties.specialty, 
            ' 전문가입니다. ',
            CASE FLOOR(RANDOM() * 5)
                WHEN 0 THEN '국가 자격증을 보유하고 있으며 꼼꼼한 시술로 유명합니다.'
                WHEN 1 THEN '최신 트렌드를 선도하며 고객 만족도가 매우 높습니다.'
                WHEN 2 THEN '피부 타입별 맞춤 관리로 최상의 결과를 보장합니다.'
                WHEN 3 THEN '친절한 상담과 섬세한 손길로 편안한 시술을 제공합니다.'
                ELSE '다년간의 노하우로 고객님께 최고의 서비스를 제공합니다.'
            END
        ) as bio,
        CONCAT('https://xsgames.co/randomusers/avatar.php?g=female&r=', FLOOR(RANDOM() * 1000000)::text) as image_url
    FROM shops s
    CROSS JOIN (
        VALUES 
            ('김미영'), ('이은주'), ('박선희'), ('최정아'), ('정민서'),
            ('강수연'), ('조아름'), ('윤채은'), ('장하나'), ('임보미'),
            ('한가인'), ('오수진'), ('서민지'), ('신예진'), ('송지아'),
            ('권유리'), ('황미선'), ('안혜원'), ('배수지'), ('문소리'),
            ('나영희'), ('고은정'), ('진주희'), ('하진아'), ('백서현'),
            ('류은채'), ('남해인'), ('독고진'), ('제갈희'), ('선우연')
    ) AS stylist_names(name)
    CROSS JOIN (
        VALUES 
            ('젤네일 아트'), ('속눈썹 연장'), ('왁싱'), ('피부관리'),
            ('네일케어'), ('패디큐어'), ('반영구 화장'), ('아이브로우'),
            ('페이셜 에스테틱'), ('바디 관리'), ('아쿠아필링'), ('각질제거')
    ) AS beauty_specialties(specialty)
    WHERE s.category = 1
    AND RANDOM() < 0.04

    UNION ALL

    -- Generate trainers for gyms
    SELECT 
        s.id as shop_id,
        trainer_names.name,
        gym_specialties.specialty,
        FLOOR(RANDOM() * 10 + 3)::int as experience_years,
        (4.0 + RANDOM() * 1.0)::numeric(3,1) as rating,
        CONCAT(
            trainer_names.name, 
            ' 트레이너는 ',
            FLOOR(RANDOM() * 10 + 3)::text, 
            '년 경력의 ', 
            gym_specialties.specialty, 
            ' 전문가입니다. ',
            CASE FLOOR(RANDOM() * 5)
                WHEN 0 THEN '체육학 전공자로 과학적인 운동 프로그램을 제공합니다.'
                WHEN 1 THEN '보디빌딩 대회 입상 경력이 있는 전문 트레이너입니다.'
                WHEN 2 THEN '재활 운동 자격증을 보유하고 있어 안전한 운동을 도와드립니다.'
                WHEN 3 THEN '영양사 자격증도 보유하여 식단 관리까지 도와드립니다.'
                ELSE '개인별 체형과 목표에 맞는 맞춤형 PT를 제공합니다.'
            END
        ) as bio,
        CONCAT('https://xsgames.co/randomusers/avatar.php?g=', 
            CASE WHEN trainer_names.gender = 'M' THEN 'male' ELSE 'female' END, 
            '&r=', FLOOR(RANDOM() * 1000000)::text
        ) as image_url
    FROM shops s
    CROSS JOIN (
        VALUES 
            -- Male trainers (80%)
            ('김강민', 'M'), ('이준혁', 'M'), ('박성호', 'M'), ('최민규', 'M'), ('정태현', 'M'),
            ('강동원', 'M'), ('조인성', 'M'), ('윤상혁', 'M'), ('장동건', 'M'), ('임창정', 'M'),
            ('한석규', 'M'), ('오지호', 'M'), ('서강준', 'M'), ('신성록', 'M'), ('송중기', 'M'),
            ('권상우', 'M'), ('황정민', 'M'), ('안재홍', 'M'), ('배성우', 'M'), ('문빈', 'M'),
            -- Female trainers (20%)
            ('김유나', 'F'), ('이소라', 'F'), ('박지영', 'F'), ('최유정', 'F'), ('정다빈', 'F'),
            ('강소영', 'F'), ('조이서', 'F'), ('윤아라', 'F'), ('장원영', 'F'), ('임나영', 'F')
    ) AS trainer_names(name, gender)
    CROSS JOIN (
        VALUES 
            ('웨이트 트레이닝'), ('크로스핏'), ('재활 운동'), ('다이어트'),
            ('바디빌딩'), ('파워리프팅'), ('기능성 운동'), ('체형교정'),
            ('스포츠 재활'), ('시니어 운동'), ('산전/산후 운동'), ('그룹PT')
    ) AS gym_specialties(specialty)
    WHERE s.category = 2
    AND RANDOM() < 0.05

    UNION ALL

    -- Generate instructors for pilates
    SELECT 
        s.id as shop_id,
        instructor_names.name,
        pilates_specialties.specialty,
        FLOOR(RANDOM() * 8 + 2)::int as experience_years,
        (4.2 + RANDOM() * 0.8)::numeric(3,1) as rating,
        CONCAT(
            instructor_names.name, 
            ' 강사님은 ',
            FLOOR(RANDOM() * 8 + 2)::text, 
            '년 경력의 ', 
            pilates_specialties.specialty, 
            ' 전문가입니다. ',
            CASE FLOOR(RANDOM() * 5)
                WHEN 0 THEN '국제 필라테스 자격증을 보유한 전문 강사입니다.'
                WHEN 1 THEN '해부학적 지식을 바탕으로 정확한 동작을 지도합니다.'
                WHEN 2 THEN '재활 필라테스 전문가로 통증 개선에 탁월합니다.'
                WHEN 3 THEN '산전/산후 필라테스 전문 자격을 보유하고 있습니다.'
                ELSE '개인의 체형과 목표에 맞는 맞춤형 프로그램을 제공합니다.'
            END
        ) as bio,
        CONCAT('https://xsgames.co/randomusers/avatar.php?g=female&r=', FLOOR(RANDOM() * 1000000)::text) as image_url
    FROM shops s
    CROSS JOIN (
        VALUES 
            ('김서윤'), ('이하린'), ('박시은'), ('최지우'), ('정수빈'),
            ('강예린'), ('조민서'), ('윤채원'), ('장서연'), ('임다은'),
            ('한소윤'), ('오지민'), ('서은채'), ('신유나'), ('송하은'),
            ('권나윤'), ('황서진'), ('안유진'), ('배서현'), ('문채은'),
            ('나은서'), ('고윤아'), ('진서영'), ('하민지'), ('백지연')
    ) AS instructor_names(name)
    CROSS JOIN (
        VALUES 
            ('매트 필라테스'), ('기구 필라테스'), ('재활 필라테스'), ('산전/산후'),
            ('체형교정'), ('코어 강화'), ('유연성 향상'), ('근력 강화'),
            ('스프링보드'), ('캐딜락'), ('리포머'), ('바렐'
    ) AS pilates_specialties(specialty)
    WHERE s.category = 3
    AND RANDOM() < 0.04
) AS all_stylists
ORDER BY shop_id, RANDOM();

-- Update time_slots for all stylists (sample available times)
INSERT INTO time_slots (stylist_id, date, start_time, end_time, is_available, created_at, updated_at)
SELECT 
    st.id,
    dates.date,
    times.start_time,
    times.end_time,
    CASE WHEN RANDOM() > 0.3 THEN true ELSE false END as is_available,
    NOW(),
    NOW()
FROM stylists st
CROSS JOIN (
    SELECT CURRENT_DATE + i as date
    FROM generate_series(0, 30) as i
) as dates
CROSS JOIN (
    VALUES 
        ('09:00', '10:00'),
        ('10:00', '11:00'),
        ('11:00', '12:00'),
        ('13:00', '14:00'),
        ('14:00', '15:00'),
        ('15:00', '16:00'),
        ('16:00', '17:00'),
        ('17:00', '18:00'),
        ('18:00', '19:00'),
        ('19:00', '20:00')
) as times(start_time, end_time)
WHERE RANDOM() < 0.1;  -- Only create some time slots, not all

-- Create more sample bookings with the new stylists
INSERT INTO bookings (user_id, shop_id, service_id, stylist_id, booking_date, booking_time, status, total_price, created_at, updated_at)
SELECT 
    (SELECT id FROM users ORDER BY RANDOM() LIMIT 1) as user_id,
    st.shop_id,
    (SELECT id FROM services WHERE shop_id = st.shop_id ORDER BY RANDOM() LIMIT 1) as service_id,
    st.id as stylist_id,
    CURRENT_DATE + INTERVAL '1 day' * FLOOR(RANDOM() * 60 - 30) as booking_date,
    TIME '09:00:00' + INTERVAL '1 hour' * FLOOR(RANDOM() * 11) as booking_time,
    CASE 
        WHEN RANDOM() < 0.7 THEN 0  -- confirmed
        WHEN RANDOM() < 0.9 THEN 1  -- pending
        ELSE 2  -- cancelled
    END as status,
    (SELECT price FROM services WHERE shop_id = st.shop_id ORDER BY RANDOM() LIMIT 1) as total_price,
    NOW() - INTERVAL '1 day' * FLOOR(RANDOM() * 30),
    NOW() - INTERVAL '1 day' * FLOOR(RANDOM() * 30)
FROM stylists st
WHERE RANDOM() < 0.05
LIMIT 500;