-- insert
-- pk, 전공정보, 학년, 외레키
insert into phoneinfo_univ values (1, '전산학', 1, 1);
insert into phoneinfo_univ values (2, '언어 문학', 3, 2);
insert into phoneinfo_univ values (3, '경제학', 4, 3);
insert into phoneinfo_univ values (4, '수학과', 2, 4);
insert into phoneinfo_univ values (5, '암호학', 3, 5);
insert into phoneinfo_univ values (6, '지구 과학', 1, 6);

-- select --------------------

-- 심심해서 확인해본 친구의 기본 정보와 대학 정보를 출력 
select * 
from phoneinfo_univ natural join phoneinfo_basic;

-- 주 전공이 함호학인 친구의 이름과 전공학을 출력
select fr_name,fr_u_major
from phoneinfo_basic a join phoneinfo_univ b
on a.idx = b.idx
where b.fr_u_major = '암호학';

-- update -------------------------------

-- 오티스의 전공을 이상의 전공으로 이전
update phoneinfo_univ
set fr_u_major = (select fr_u_major 
                  from phoneinfo_univ natural join phoneinfo_basic
                  where fr_name = '이상')
where idx = (select idx
             from phoneinfo_univ natural join phoneinfo_basic
             where fr_name = '오티스');
             
-- 학년이 잘못 표시된 언어 문학의 학년을 2학년으로
update phoneinfo_univ
set fr_u_year = 2
where fr_u_major = '언어 문학';

-- delete ------------------------------ 

-- 먼지가 되여 사라진 전산학과 지구 과학을 삭제
delete from test
where fr_u_major in('전산학', '지구 과학');

-- 장난으로 학과의 순서가 친구의 학년과 같으면 삭제
delete from test
where idx = fr_u_year;







