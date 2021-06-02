# finalProject_team3

### 자취생들을 위한 커뮤니티 사이트(21.04.22 ~ 21.05.11)

#### 주요기능
1. 우리집 인테리어 자랑 서비스
2. 공동구매 신청, 취소
3. 질문 및 답변 서비스
4. 전문가 인테리어 시공 사례
5. 인테리어 견적 문의

#### 담당한 기능
1. interceptor를 이용한 로그인 여부 체크
2. interceptor를 이용하여 글,댓글 작성시 회원 등급 부여
3. 공동구매 게시판의 모든 기능들
- Restful Service와 부트스트랩을 이용한 게시글 리스트 페이징처리
- DynamicSQL을 이용한 검색옵션별(전체, 제목, 글내용, 작성자) 검색 리스트 기능
- Date객체를 이용하여 마감날짜와 오늘날짜를 비교하여 현재 공동구매 상태를 자동으로 변경하는 기능
- File객체를 이용한 여러장의 파일 업로드, 삭제 기능
- 공동구매 글쓰기, 수정, 삭제 기능
- 글 수정시 ajax를 이용하여 최대참여자 수 수정시 현재 신청자 수와 비교하는 기능
- 글 수정시 Date객체를 이용하여 마감날짜 변경시 오늘 날짜와 비교하는 기능
- ajax, JQuery를 이용하여 공동구매 신청, 취소 하는 기능
- ajax, JQuery를 이용하여 현재 신청자 명단을 보여주는 기능
- ajax, JQuery를 이용하여 해당 글의 댓글 리스트를 불러오는 기능
- ajax, JQuery를 이용하여 댓글 등록, 삭제, 추천/취소, 신고 하는 기능
- ajax, JQuery를 이용하여 해당하는 댓글의 대댓글 리스트를 불러오는 기능
- ajax, JQuery를 이용하여 대댓글 등록, 삭제, 신고 하는 기능
