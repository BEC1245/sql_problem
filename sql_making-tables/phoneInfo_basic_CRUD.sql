
-- insert
 -- PK, 친구이름, 친구전화번호, 이메일, 주소, 등록시간 / 전화번호 string 임
insert into phoneinfo_basic values (1, '이상', '010-1111-1112', 'YiSang@gmail.com', '서울', '1910/09/23');
insert into phoneinfo_basic values (2, '파우스트', '010-1234-1234', 'Faust@gmail.com', '인천', '1749/08/28');
insert into phoneinfo_basic values (3, '돈키호테', '010-4444-4444', 'donQuixote@naver.com', '부산', null);
insert into phoneinfo_basic values (4, '싱클레어', '010-1588-8282', 'sinClair@naver.com', '강원', '1877/07/02');
insert into phoneinfo_basic values (5, '히스클리프', '010-1357-1113', 'Heathcliff@naver.com', '대구', null);
insert into phoneinfo_basic values (6, '오티스', '010-3141-5926', 'Otis@kakao.com', '경북', null);
insert into phoneinfo_basic values (7, '오티스', '010-3141-5926', 'Otis@kakao.com', '경북', null);

-- select -------------------

-- 생성 날자의 등록이 실패한 친구의 pk, 이름, 이메일을 출력
select idx, fr_name, fr_email
from phoneinfo_basic
where fr_regdate is null;

-- 서울에 거주하고 있는 친구의 이름
select fr_name
from phoneinfo_basic
where fr_address = '서울';

-- UPDATE ----------------------------

-- 생성 날자의 등록이 실패한 친구의 생성날자 수정
update test --phoneinfo_basic
set fr_regdate = sysdate
where fr_regdate is null;

-- 전화번호를 잘못 등록한 친구의 전화번호 수정
update test --phoneinfo_basic
set fr_phonenumber = '010-3323-1987'
where fr_name = '돈키호테';

-- delete

-- 친구 관계를 정리한 히스클리프의 데이터 삭제
delete from test
where fr_name = '히스클리프';

-- 잘못 중복 등록한 데이터를 모두 삭제
delete from test
where idx in(select idx from test where fr_name = (select fr_name from test group by fr_name having count(fr_name) >= 2));









