-- problems

-- 16. SUBSTR 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력하시오.
select substr(hiredate, 1, 2) as "입사년도", substr(hiredate, 4, 2) as "입사 달" from emp;

-- 17. SUBSTR 함수를 사용하여 4월에 입사한 사원을 출력하시오.
select ename from emp where substr(hiredate, 4, 2) = '04';

-- 18. MOD 함수를 사용하여 사원번호가 짝수인 사람만 출력하시오.
select ename from emp where mod(empno, 2) = 0;

-- 19. 입사일을 년도는 2자리(YY), 월은 숫자(MM)로 표시하고 요일은 약어 (DY)로 지정하여 출력하시오.
select to_char(hiredate, 'YYMMDY') from emp;

-- 20. 올해 몇 칠이 지났는지 출력하시오. 현재날짜에서 올해 1월 1일을 뺀 결과를 출력하고 TO_DATE 함수를 사용하여 데이터 형을 일치 시키시오.
select floor(sysdate - to_date('230101', 'YYMMDD')) from dual;

-- 21. 사원들의 상관 사번을 출력하되 상관이 없는 사원에 대해서는 NULL 값 대신 0으로 출력하시오.
select nvl(mgr, 0) from emp;

-- 22. DECODE 함수로 직급에 따라 급여를 인상하도록 하시오. 직급이 ‘ANALIST”인 사원은 200, ‘SALESMAN’인 사원은 180, ‘MANAGER’인 사원은 150, ‘CLERK”인 사원은 100을 인상하시오.
select decode(job, 'ANALIST', sal + 200,
                   'SALESMAN', sal + 180,
                   'MANAGER', sal + 150,
                   'CLERK', sal + 100, sal) 
from emp;

-- 23. 모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력하시오. 평균에 대해서는 정수로 반올림하시오.
select max(sal), min(sal), sum(sal), floor(avg(sal)) from emp;

-- 24. 각 담당 업무 유형별로 급여 최고액, 최저액, 총액 및 평균 액을 출력하시오. 평균에 대해서는 정수로 반올림 하시오.
select max(sal), min(sal), sum(sal), floor(avg(sal)) from emp group by job;

-- 25.  COUNT(*) 함수를 이용하여 담당업무가 동일한 사원 수를 출력하시오.
select count(*) from emp group by job;

-- 26. 관리자 수를 출력하시오.
select count(*) from emp group by job having job = 'MANAGER';

-- 27. 급여 최고액, 급여 최저액의 차액을 출력하시오.
select max(sal), min(sal), max(sal) - min(sal) from emp;

-- 28. 직급별 사원의 최저 급여를 출력하시오. 관리자를 알 수 없는 사원과 최저 급여가 2000 미만인 그룹은 제외시키고 결과를 급여에 대한 내림차순으로 정렬하여 출력하시오.
select min(sal)
from emp 
where mgr is not null
group by job
having min(sal) > 2000;

-- ​29. 각 부서에 대해 부서번호, 사원 수, 부서 내의 모든 사원의 평균 급여를 출력하시오. 평균 급여는 소수점 둘째 자리로 반올림 하시오.
select deptno, count(job), round(avg(sal), 2) 
from emp 
group by deptno; 

-- 30. 각 부서에 대해 부서번호 이름, 지역 명, 사원 수, 부서내의 모든 사원의 평균 급여를 출력하시오. 평균 급여는 정수로 반올림 하시오. DECODE 사용.
select deptno, decode(deptno, 10, 'DNAME : ACCOUNTING / LOC : NEW YORK',
                              20, 'DNAME : RESEARCH / LOC : DALLAS',
                              30, 'DNAME : SALES / LOC : CHICAGO',
                              40, 'DNAME : OPERATIONS / LOC : BOSTON', 'NONE') as "name and loc",
               round(avg(sal)) 
from emp 
group by deptno;

select * from dept;

