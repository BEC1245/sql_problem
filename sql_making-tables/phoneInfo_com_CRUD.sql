-- insert
insert into phoneInfo_com  values (1, '삼성', 1);
insert into phoneInfo_com  values (2, '카카오', 2);
insert into phoneInfo_com  values (3, '구글', 3);
insert into phoneInfo_com  values (4, '버거킹', 4);
insert into phoneInfo_com  values (5, '베스킨 라빈스', 5);
insert into phoneInfo_com  values (6, '넥슨', 6);
insert into phoneInfo_com values (7, 'LG', 7);

-- select -------------------

-- 고등,대학 동기였던 파우스트의 회사명을 출력
select fr_c_company
from phoneInfo_com natural join phoneinfo_basic
where fr_name = '파우스트';

-- 버거킹의 순서 번호를 출력
select idx
from phoneInfo_com
where fr_c_company = '버거킹';


-- UPDATE ----------------------------

-- 회사명이 바뀐 이상의 회사명을 수정
update phoneInfo_com
set fr_c_company = '사성'
where idx = (select idx from phoneInfo_basic where fr_name = '이상');

-- 미처날뛴 핸드폰이 일으킨 버그로 모든 회사명이 맥도날드로 수정
update phoneInfo_com
set fr_c_company = '맥도날드';

-- delete

-- 구글의 갑작스러운 파산으로 사라저 회사명을 삭제
delete from phoneInfo_com
where fr_c_company = '구글';

-- 폰을 바꿔도 다시 발생한 치명적인 버그로 모든 회사 데이터를 삭제
delete from phoneInfo_com;

-- 아니면
truncate table phoneInfo_com;

drop table test;









