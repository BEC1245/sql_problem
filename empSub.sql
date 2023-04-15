-- 43. 사원 번호가 7788인 사원과 담당 업무가 같은 사원을 표시(사원 이름과 담당업무)하시오.
select ename, job
from emp e
where e.job = (select job from emp join dept using(deptno) where empno = 7788);


-- 44. 사원번호가 7499인 사원보다 급여가 많은 사원을 표시하시오. 사원이름과 감당 업무
select ename, job
from emp e
where e.sal > (select sal from emp where empno = 7499);


-- ​45. 최소급여를 받는 사원의 이름, 담당업무 및 급여를 표시하시오. (그룹함수 사용)
select e.ename, e.job, e.sal
from emp e
where e.sal = (select min(sal) from emp);


-- 46. 평균급여가 가장 적은 직급의 직급 이름과 직급의 평균을 구하시오.
-- 서브쿼리에서 평균 값을 만들어 그 위의 서브커리에 전달해 최소를 계산하는 식
select job, avg(sal)
from emp
group by job
having avg(sal) = (select min(avgSal) from (select avg(sal) as avgSal from emp group by job) sub); 


-- ​47. 각 부서의 최소 급여를 받는 사원의 이름, 급여, 부서번호를 표시하시오
-- from의 서브쿼리에 최소값을 만들어 급여가 똑같은 사람끼리 조인하는 식
select a.ename, a.sal, a.deptno
from emp a join (select min(sal) as pay from emp group by deptno) b
on a.sal = b.pay
order by a.sal desc;


-- ​48. 담당업무가 ANALYST 인 사원보다 급여가 적으면서 업무가 ANALYST가 아닌 사원들을 표시(사원번호, 이름, 담당 업무, 급여)하시오.
-- 서브 쿼리로 job이 analyze인 사원의 월급의 최소를 구해 job이 analyze가 아닌 사원과 비교
select b.empno, b.ename, b.job, b.sal
from emp b
where sal < (select min(a.sal) from emp a where job = 'ANALYST') and b.job != 'ANALYST';


-- 49. 부하직원이 없는 사원의 이름을 표시하시오.
-- null 문제를 해결하지 않으면 아무것도 안 띄어준다
select a.ename
from emp a 
where empno not in (select distinct mgr from emp where mgr is not null);


-- 50. 부하직원이 있는 사원의 이름을 표시하시오.
-- mgr에서 하나라도 자신의 번호가 있으면 출력
select a.ename
from emp a 
where empno in (select distinct mgr from emp);


-- ​51. BLAKE와 동일한 부서에 속한 사원의 / 이름과 / 입사일을 표시하는 질의를 작성하시오. ( 단 BLAKE는 제외 )
select a.ename, a.hiredate
from emp a
where deptno = (select deptno from emp b where b.ename = 'BLAKE') and a.ename != 'BLAKE';


-- ​52. 급여가 평균 급여보다 많은 사원들의 사원 번호와 이름을 표시하되 결과를 급여에 대해서 오름차순으로 정렬하시오.
select a.empno, a.ename
from emp a
where a.sal > (select avg(b.sal) from emp b)
order by a.sal;


-- 53. 이름에 K가 포함된 사원과 같은 부서에서 일하는 사원의 사원 번호와 이름을 표시하시오.
select a.empno, a.ename
from emp a
where a.deptno in(select deptno from emp b where b.ename like ('%K%'));


-- 54. 부서위치가 DALLAS인 사원의 이름과 부서번호 및 담당업무를 표시하시오.
select a.ename, a.deptno, a.job
from emp a join (select deptno from dept where loc = 'DALLAS') b
on a.deptno = b.deptno;


-- 55. KING에게 보고하는 사원의 이름과 급여를 표시하시오.
select a.ename, a.sal
from emp a
where mgr = (select empno from emp b where b.ename = 'KING');


-- 56. RESEARCH 부서의 사원에 대한 부서번호, 사원이름 및 담당 업무를 표시하시오.
select empno, ename, job
from emp
where deptno = (select deptno from dept where dname = 'RESEARCH');


-- 57. 평균 월급보다 많은 급여를 받고 이름에 M이 포함된 사원과 같은 부서에서 근무하는 사원의 사원 번호, 이름, 급여를 표시하시오.
select a.empno, a.ename, a.sal
from emp a
where a.sal > (select avg(b.sal) from emp b)
and a.deptno in(select c.deptno from emp c where c.ename like('%M%'));


-- 58. 평균급여가 가장 적은 업무를 찾으시오.
-- ps. 46번과 동일한 코드지만 인라인뷰 버전 (업무 == job으로 보고 해결)
select a.job, a.newAvg
from (select job, avg(sal) as newAvg from emp group by job) a
	 join (select min(avgEmp.newSal) as newMin  from (select avg(sal) as newSal from emp group by job) avgEmp) b
on a.newAvg = b.newMin;


-- 59. 담당업무가 MANAGER 인 사원이 소속된 부서와 동일한 부서의 사원을 표시하시오.
-- 매니저는 모든 부서에 있기에 모든 사람이 출력됨 (만약 여기서 JOB을 'ANALYST'로 바꾸면 부서 번호가 20인 데이터만 출력)
select ename
from emp
where deptno in(select deptno from emp where job = 'MANAGER');


