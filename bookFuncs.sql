-- 박지성의 총 구매액(박지성의 고객번호는 1번으로 놓고 작성)
-- 박지성의 구매한 도서의 수(박지성의 고객번호는 1번으로 놓고 작성)
select sum(price), count(custid) 
from book, customer 
where bookname like('축구%') and custid = 1;

-- 마당서점 == 도서관
-- (1) 마당서점 도서의 총 개수
select count(bookid)
from book;

-- (2) 마당서점에 도서를 출고하는 출판사의 총개수
select count(publisher)
from book
where publisher != 'Pearson';

-- 후기
고정 관념이라는게 참 무서운 것 같습니다
from에 두개의 행을 넣어 퍼플리셔가 축구인 것만 
골라서 like 할 수 있었는데

되지도 않는 group by 문에
"자 이건 새로운 정렬 형식이란다 어서먹머^^"라며
강제로 group by substt(bookname, 1, 2)로만
주구 장창 풀려고 해서 꽤나 오랜 시간이 걸렸네요


