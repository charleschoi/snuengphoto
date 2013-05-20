# 공대 공모전
## 회원 관리 방식
- 이메일
- 비밀번호

## 정보 받기
- 이름
- 소속 (dropdown 방식)
- 학번 (xxxx-xxxxx)
- 핸드폰번호
- 작품명
- 작품 속 장소 및 시기
- 작품설명 기재(50자 이내)

## 규정
1. 1인 3점 이하

## 일정
1. 접수기간 : 2013년 6월 3일(월) ~ 6월 28(금), 4주간
2. 심사일정 : 2013년 7월 1일(월) ~ 7월 31일(수)
3. 결과발표 : 2013년 8월 중, 홈페이지 공지 및 개별 통보


## 설계
### 컨트롤러
1. User // login_process find_pw_send reset_pw
2. Photo // index register register_process del result
3. Admin // index
### 모델
1. User // email:string password_hash:string name:string dept_id:integer student_id:string phone:string find_pw_code:string
2. Photo // user_id:integer photo_abc:integer title:string where:string when:string description:string photo_saved_name:string photo_real_name:string