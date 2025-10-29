show tables;

create table kakaoAddress (
  idx       int not null auto_increment primary key,
  address   varchar(50) not null,			/* 지점명 */
  latitude  double not null,					/* 위도 */
  longitude double not null 					/* 경도 */
);

desc kakaoAddress;

-- MyDB에 저장된 지명과 주변 함께 검색지 '등록/조회'를 위한 테이블
create table kakaoPlace (
  idx        int not null auto_increment,	/* 고유번호 */
  addressIdx int not null,								/* 기존에 저장된 주소의 고유번호 */
  latitude   double not null,				/* 위도 */
  longitude  double not null,				/* 경도 */
  place      varchar(50),						/* 지점 장소명 */
  content    text,									/* 상세설명 */
  primary key(idx),
  foreign key(addressIdx) references kakaoAddress(idx)
);
desc kakaoPlace;