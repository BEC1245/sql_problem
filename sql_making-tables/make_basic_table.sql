create table phoneInfo_basic (
    idx number(6) CONSTRAINT PK_idx_pBasic primary key,
    fr_name varchar(20) constraint notNull_frName_pBasic not null,
    fr_phonenumber varchar(20) constraint notNull_frPhonenumber_pBasic not null,
    fr_email varchar(20),
    fr_address varchar(20),
    fr_regdate date default sysdate
);

create table phoneInfo_univ (
    idx number(6) constraint PK_idx_pUniv primary key,
    fr_u_major varchar(20) default 'N' constraint notNull_frUmajor_pUniv not null,
    fr_u_year number(1) default 1 constraint notNull_frUyear_pUniv not null,
    fr_ref number(7) not null,
    constraint REF_frRef_pUniv Foreign key(fr_ref) references phoneInfo_basic(idx)
);

create table phoneInfo_com (
    idx number(6) constraint PK_idx_pInfoCom primary key,
    fr_c_company varchar(20) default 'N' constraint notNull_frCcompany_pInfoCom not null,
    fr_ref number(6) not null,
    constraint REF_frRef_pInfoCom foreign key(fr_ref) references phoneInfo_basic(idx)
);

