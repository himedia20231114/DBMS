/*
    JOIN 실습 
        member10 : 회원정보를 저장하는 테이블 
        zipcode10 : 우편번호를 저장하는 테이블 
        product10 : 제품 정보를 저장하는 테이블 
        order10 : 주문 정보를 저장하는 테이블 
*/

create table zipcode10 (
        zipcode number(6) not null constraint PK_ZIPCODE10_ZIPCODE Primary key, 
        si_do varchar2(200) not null, 
        gu_gun varchar2(200) not null, 
        bungi varchar2(200) not null
) ; 

create table member10 (
        m_id number(4) not null constraint PK_MEMBER10_M_ID primary key, 
        pass varchar2(200) not null , 
        name varchar2(200) not null, 
        email varchar2(200) not null , 
        zipcode number(6) null , 
        -- Foreign Key 제약 조건 추가함. : member10(zipcode)  ===> zipcode10(zipcode) 
            constraint FK_MEMBER10_ZIPCODE foreign key (zipcode) references ZIPCODE10(zipcode) 
); 

create table product10 (
        pro_id number(6) not null constraint PK_PRODUCT10_PRO_ID primary key , 
        pro_name varchar2(200) not null, 
        pro_price number(7,2) not null , 
        pro_cnt number(4) default 0 not null 
);

create table order10 (
    ord_id number(6) not null constraint PK_ORDER10_ORD_ID primary key, 
    m_id  number(4) not null,      -- FK  : MEMBER10(m_id)
    pro_id number(6) not null,    -- FK  : PRODUCT10 (pro_id) 
        -- Foreign Key 2개 
        constraint FK_ORDER10_M_ID foreign key (m_id) references member10(m_id), 
        constraint FK_ORDER10_PRO_ID foreign key (pro_id) references product10(pro_id)   
);

-- 각 테이블에 레코드 5개씩 넣습니다. 

-- ANSI JOIN 문을 사용해서 주문정보(Order10)테이블을 기준으로 
     -- 주문자명, 주문자메일주소, 주문자번지(시도), 주문제품명, 제품의 가격을 출력 합니다.   , 
     --order10, member10, zipcode10, product10
     
     





