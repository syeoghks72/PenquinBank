--��� ���°� ��ȿ���� üũ
select name, accnum, money from account, member where accnum='523210524477' and member_email=email;  

--�� ���� ���� ���� �� �۱ݰ��� ����
select e.name, e.accnum, e.money, 
case when e.money <1000 then '1'
else '2'
end as "balance_check"
from(
  (select name, accnum, money 
  from account, member 
  where accnum='523210524477' and member_email=email) e);

select * from account;
select * from timeline;


insert into account values('523210524477', '1570000', '1507', 'pq', 'syeoghks72@naver.com');
insert into account values('523210599911', '6770000', '1212', 'pq', 'sydesign24@naver.com');


update account set money = money -5000 where accnum = '523210524477';
insert into timeline  values(timeline_seq.nextval, '�ּҿ�', '5000', null, sysdate, '523210599911');
insert into timeline values(timeline_seq.nextval, '����ȯ', null, '5000', sysdate, '523210524477');