# EasyRun
패턴 인식을 통한 편리한 앱 실행(CoreML을 통한 launcher 어플리케이션)

# 프로젝트 소개
패턴을 그려서 앱을 실행할수 있게 하는 것을 목표로 한다.

1. PC를 통해 **패턴을 미리 학습**시킨다.
2. 사용자가 정해진 **패턴과 어플을 매칭**시킨다.
3. 정해진 패턴을 통해 **손 쉽게 어플을 실행**시킨다.

# 지도교수 및 멘토 소개
| 성함 | 직책 | 역할 |
| :--: | :--: | :--: |
| 구명완 | 지도교수 | 기술 자문 및 방향 제시 |
| 윤성관 | 산업체 멘토 ( 코더스 하이) | 앱 적용 방향 및 기술 조언 |

# 구성원 소개 및 역할 분담
| 이름 | 학번 | 학과 | 역할 |
| :--: | :--: | :--: | :--: |
| 강민석 | 2013**** | 컴퓨터공학과 | 팀장, 머신러닝 학습 알고리즘 적용 |
| 김영인 | 2013**** | 컴퓨터공학과 | 팀원, DB 연동, UI/UX 개발 |
| 김주훈 | 2013**** | 컴퓨터공학과 | 팀원, UI/UX 개발, 위키 작성 |

# 프로젝트 추진 배경
설치된 어플이 너무 많을 경우 찾거나 관리하는데 어려움이 있다. 
![어플사진](https://user-images.githubusercontent.com/25974715/58153100-36aaef00-7ca9-11e9-9645-dc42abab1c31.jpeg)

# Launcher 어플리케이션 소개
<div>
  <img width="658" alt="Launcher_1" src="https://user-images.githubusercontent.com/25974715/58153182-6659f700-7ca9-11e9-9129-65a0216993ad.png">
  <img width="983" alt="Launcher_2" src="https://user-images.githubusercontent.com/25974715/58153208-71148c00-7ca9-11e9-8ced-6ba04f2032b0.png">
</div>

# Launcher 어플리케이션 개발자 피드백
<div>
  <img width="620" alt="이메일_1" src="https://user-images.githubusercontent.com/25974715/58153248-85f11f80-7ca9-11e9-9e1a-f26349b2890e.png">
  <img width="1345" alt="이메일_2" src="https://user-images.githubusercontent.com/25974715/58153269-8ee1f100-7ca9-11e9-8d41-76f85f5b35ec.png">
</div>

# 프로젝트 상세
### 1. Google Firebase 플랫폼을 통한 DB 연동

**Firebase Database에 저장된 URL Scheme**과 비교하여 현재 설치된 앱 목록 표시

<div>
  <span>
    <img width="20%" alt="EasyRun_앱목록1" src="https://user-images.githubusercontent.com/25974715/58153493-1d567280-7caa-11e9-8fd1-1cdb1bdd64a4.png">
  </span>
  <span>
    <img width="70%" alt="Firebase" src="https://user-images.githubusercontent.com/25974715/58153425-ebdda700-7ca9-11e9-9ad4-1ee9113b0c92.png">
  </span>
</div>

### 2. 직접 학습시킨 CoreML 모델 적용

* Jupyter Notebook에서 python 코드로 직접 학습 시킨 CoreML 모델 사용. (Keras 이용) 
* 0-9, a-f, check, heart, star, smile face, sad face, angry face 등의 패턴을 학습.
* 학습시킨 CoreML 모델을 다음 화면에 적용.

<div>
  <span>
    <img width="30%" alt="EasyRun_메인" src="https://user-images.githubusercontent.com/25974715/58156013-17fc2680-7cb0-11e9-96bc-806da63e7d36.jpg">
  </span>
    
  <span>
    <img width="30%" alt="EasyRun_매칭목록1" src="https://user-images.githubusercontent.com/25974715/58156079-437f1100-7cb0-11e9-9224-6a491a13850f.jpg">
  </span>
  
  <span>
    <img width="30%" alt="EasyRun_매칭목록2" src="https://user-images.githubusercontent.com/25974715/58156089-4974f200-7cb0-11e9-8c43-68bcc15f4fc5.jpg">
  </span>
</div>

# 프로젝트 결과
총 4가지 화면으로 구성되어 있다. (아래 순서대로 화면들을 배치함)

1. 인 화면 : 매칭이 완료된 패턴을 그리면 앱이 실행되며 clear 버튼을 누르면 패턴이 지워진다. (정확도가 99% 이상일 경우만 앱 실행)
2. 매칭 목록 화면 : 매칭이 완료된 패턴과 앱 이름을 보여준다. Edit으로 삭제할수 있으며, + 버튼을 누르면 앱 목록 창으로 넘어간다.
3. 앱 목록 화면 : Refresh 버튼으로 재 검색할 수 있으며, 한번 검색 된 결과는 계속 남아있다. (Firebase와 연동)
4. 추가 화면 : 앱 목록 화면에서 앱을 누르면 이 화면으로 넘어온다. PickerView로 패턴 선택을 할 수 있으며, 매칭을 누르면 매칭이 완료되고, 매칭 목록 화면으로 넘어간다.

<div>
  <span>
    <img width="22%" alt="EasyRun_메인" src="https://user-images.githubusercontent.com/25974715/58156013-17fc2680-7cb0-11e9-96bc-806da63e7d36.jpg">
  </span>
  
  <span>
    <img width="22%" alt="EasyRun_매칭목록1" src="https://user-images.githubusercontent.com/25974715/58156079-437f1100-7cb0-11e9-9224-6a491a13850f.jpg">
  </span>
  
  <span>
    <img width="22%" alt="EasyRun_앱목록1" src="https://user-images.githubusercontent.com/25974715/58156338-d6b84680-7cb0-11e9-8eb4-7a8584384fc3.jpg">
  </span>
  
  <span>
    <img width="22%" alt="EasyRun_추가창1" src="https://user-images.githubusercontent.com/25974715/58156349-dcae2780-7cb0-11e9-8a0e-3e64adf35829.jpg">
  </span>
</div>

# 추가 기능
1. 전화번호나 메신저 앱을 선택시 아래와 같은 창이 뜨면서 전화번호를 입력할 수 있다.
2. URL을 선택시 아래와 같은 창이 뜨면서 website 주소를 입력할 수 있다. (즐겨찾기 기능)

<div>
  <span>
    <img width="45%" alt="EasyRun_추가기능1" src="https://user-images.githubusercontent.com/25974715/58156504-2e56b200-7cb1-11e9-9a55-46334981e6e1.jpg">
  </span>
  
  <span>
    <img width="45%" alt="EasyRun_추가기능2" src="https://user-images.githubusercontent.com/25974715/58156899-264b4200-7cb2-11e9-8373-d709539fa9f1.jpg">
  </span>
</div>

# 회의 내용
* 3월 : 기존의 런처앱 분석. 프로젝트 방향 설정.
       학습을 단말기로 하기에는 한계가 있으므로 사전에 학습된 패턴을 사용자가 선택하는 방법을 채택.
* 4월 : 설치된 앱 리스트 가져오기. url scheme에 대한 분석.
* 5월 : 패턴학습을 통한 CoreML 모델 개발. 앱의 여러 기본적인 화면들 구성.
       단순한 앱 실행을 넘어서 사용자들의 workflow를 빠르게 실행할 수 있는 기능 추가. (멘토와의 만남 1)
* 6월 : 학습 모델의 정확도 높이기. 앱 UI/UX, 화면 디자인 수정.
       최종 발표 자료 만들기. 앱 만들기 마무리 작업. (멘토와의 만남 2)

# 앞으로의 과제
1. UI/UX를 더 직관적이고 사용자가 쉽게 이해할수 있게 수정
2. 패턴의 다양성 추가 및 인식률 높이기
3. 어플의 아이콘을 받아오는 방법 (애플 스토어 활용)
4. 더 많은 workflow들을 간편하게 실행할수 있는 추가기능 구현하기
5. ios에 여러 기술적인 제한들이 있어 현재는 개발에 어려움이 많지만, 나중에 기술적인 제한들이 풀렸을때 좀 더 유용하게 쓰일수 있는 앱

# 기대 효과
### 간편한 어플 실행
1. 패턴을 통해 간편하고 빠르게 어플을 실행
2. 어플의 위치를 찾아 헤맬 필요가 없어 시간 단축 (아래 화면처럼 EasyRun 아이콘(번개모양)을 고정 시켜 놓고, 바로 패턴을 그려서 앱 실행)

<div>
  <span>
    <img width="45%" alt="EasyRun_앱아이콘" src="https://user-images.githubusercontent.com/25974715/58157062-8510bb80-7cb2-11e9-9939-b4f86908f8cf.jpg">
  </span>
  
  <span>
    <img width="45%" alt="EasyRun_메인1" src="https://user-images.githubusercontent.com/25974715/58157073-8b9f3300-7cb2-11e9-80be-fa872f681648.jpg">
  </span>
</div>

### 시각장애인 지원까지 확장가능
1. 최초 음성인식을 통해 매칭을 한 번 하면, 그 이후에 다양한 시각장애인용 어플들을 간편하게 실행가능
2. 음성인식을 통한 어플 실행보다 빠르고, 조용한 주변 환경이나, 주변의 시선을 신경 쓸 필요가 없음
