create table member(
    email varchar2(40),
    password varchar2(40),
    name varchar2(30),
    phone varchar2(30),
    pernum varchar2(30),
    constraint member_email_pk primary key(email)
);

create table notice(
    nnum number, 
    title varchar2(30),
    contents varchar2(1500),
    vnum varchar2(30),
    ndate varchar2(30),
    member_email varchar2(40),
    constraint notice_nnum_pk primary key(nnum),
    constraint notice_member_email_fk foreign key(member_email) references member(email)
);

create table fileInfo(
    fnum number,
    fname varchar2(30),
    fsize varchar2(30),
    fplace varchar2(30),
    notice_nnum number,
    constraint fileinfo_fnum_pk primary key(fnum),
    constraint fileinfo_notice_nnum_fk foreign key(notice_nnum) references notice(nnum)
);



create table account(
    accnum varchar2(40),
    money varchar2(30),
    password varchar2(30),
    bankname varchar2(30),
    member_email varchar2(40),
    constraint account_accnum primary key(accnum),
    constraint account_member_email_fk foreign key(member_email) references member(email)
);

create table timeline(
    timenum number,
    trader varchar2(40),
    sentmoney varchar2(30),
    receivemoney varchar2(30),
    whentime varchar2(30),
    account_accnum varchar2(40),
    constraint timeline_timenum_pk primary key(timenum),
    constraint timeline_account_accnum_fk foreign key(account_accnum) references account(accnum)
);

create table accountdetail(
    accdetailnum number,
    acctype varchar2(30),
    paymentamount varchar2(30),
    apr varchar2(30),
    paymonth varchar2(30),
    paymentday varchar2(30),
    maturitydate varchar2(30),
    lastpaymentdate varchar2(30),
    account_accnum varchar2(40),
    constraint accdetail_accdetailnum_pk primary key (accdetailnum),
    constraint accdetail_account_accnum_fk foreign key(account_accnum) references account(accnum)
);