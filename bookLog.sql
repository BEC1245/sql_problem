-- (1) 도서번호가1인도서의이름
select * from BOOK where bookid = 1;

-- (2) 가격이20,000원이상인도서의이름
select * from BOOK where price >= 20000;

-- (3) 모든고객의이름, 주소
select name, address from customer;

-- (4) 2014년7월4일 ~ 7월7일사이에 주문받은도서의주문번호
select * from orders where orderdate between '2014/7/4' and '2014/7/7';

-- (5) 2014년7월4일~7월7일사이에주문받은도서를제외한도서의주문번호
select * from orders where not orderdate between '2014/7/4' and '2014/7/7';

-- (6) 성이‘김’씨인고객의이름과주소
select address, name from customer where name like '김%';

-- (7) 성이‘김’씨이고이름이‘아’로끝나는고객의이름과주소
select address, name from customer where name like '김%' and name like '%아';





