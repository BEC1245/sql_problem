-- 박지성의 총 구매액(박지성의 고객번호는 1번으로 놓고 작성)
-- 박지성의 구매한 도서의 수(박지성의 고객번호는 1번으로 놓고 작성)
select sum(saleprice), count(custid) 
from orders
group by custid
HAVING custid = 1;

-- 마당서점 == 도서관
-- (1) 마당서점 도서의 총 개수
select count(bookid)
from book;

-- (2) 마당서점에 도서를 출고하는 출판사의 총개수
select count(distinct publisher)
from book
where publisher != 'Pearson';

select * from orders;


