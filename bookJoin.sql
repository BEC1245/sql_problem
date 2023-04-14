-- 1 마당서점의 고객이 요구하는 다음질문에 대해 SQL 문을 작성하시오.
-- (5) 박지성이 구매한 도서의 출판사 수

SELECT SUM(SALEPRICE)
FROM BOOK B INNER JOIN ORDERS O
USING(BOOKID)
WHERE O.CUSTID = 1;

-- (6) 박지성이 구매한 도서의이름, 가격, 정가, 판매가격의차이
SELECT BOOKNAME, SALEPRICE, PRICE, PRICE - SALEPRICE
FROM BOOK B INNER JOIN ORDERS O
USING(BOOKID)
WHERE O.CUSTID = 1;

-- (7) 박지성이구매하지않은도서의이름
SELECT b.bookname
FROM ORDERS O INNER JOIN BOOK B
USING(BOOKID)
where o.custid != 1;

-- 2 마당서점의 운영자와 경영자가 요구하는 다음 질문에 대해 SQL 문을작성하시오.

-- (8) 주문하지 않은 고객의 이름(부속질의사용)
SELECT A.NAME
FROM CUSTOMER A, ORDERS B
WHERE A.CUSTID = B.CUSTID(+) 
AND B.CUSTID IS NULL; 

-- (9) 주문금액의 총액과 주문의 평균금액
SELECT SUM(SALEPRICE), AVG(SALEPRICE)
FROM ORDERS;

-- (10) 고객의 이름과 고객별 구매액
SELECT CUSTOMER.name ,sum(orders.saleprice)
FROM CUSTOMER join ORDERS
on CUSTOMER.CUSTID = ORDERS.CUSTID
group BY CUSTOMER.name;

-- (11) 고객의 이름과 고객이 구매한 도서목록
SELECT A.NAME, B.BOOKNAME
FROM CUSTOMER A, book B, ORDERS C
WHERE A.CUSTID = C.CUSTID AND B.BOOKID = C.BOOKID
ORDER BY A.CUSTID;

-- (12) 도서의가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문
select *
from book a natural join orders b
where a.price - b.saleprice = 
(select max(a.price - b.saleprice) 
from book a natural join orders b);

-- (13) 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
select d.name
from customer d
where d.custid in (select a.custid from orders a group by a.custid having avg(a.saleprice) > (select avg(c.saleprice) from orders c));

-- (1) 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
select *
from customer cu join orders ord on cu.custid = ord.custid
join book bk on ord.bookid = bk.bookid
where bk.publisher
in(select publisher from customer a, orders b, book c where a.name = '박지성' and a.custid = b.custid and b.bookid = c.bookid) and cu.name != '박지성';

-- 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
select cu.name 
from customer cu
where cu.custid in(select orders.custid from book natural join orders group by orders.custid having count(distinct publisher) >= 2);


