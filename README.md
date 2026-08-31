# KWS Project — 공통 문서 허브

kwsDeveloper의 모든 프로젝트에서 공통으로 참고하는 가이드·문서 저장소입니다.

---

## 저장소 구성

| 저장소 | 용도 | 주소 |
|--------|------|------|
| **kws-project** (여기) | 공통 문서·가이드 허브 | github.com/kwsDeveloper/kws-project |
| **kws-portal** | KWS 업무 포털 코드 | github.com/kwsDeveloper/kws-portal |

---

## PC 설정 가이드 (PC 4 신규 추가 기준)

### 1단계 — PC를 처음 쓸 때 (최초 1회)

어떤 PC든 처음 Claude Code와 GitHub를 연동할 때 한 번만 실행합니다.

| 순서 | 할 일 | 어디서 | 명령 |
|------|-------|--------|------|
| 1 | GitHub CLI 설치 | Windows 터미널(cmd) | `winget install --id GitHub.cli` |
| 2 | GitHub 로그인 | Windows 터미널(cmd) | `gh auth login` |
| 3 | 전역 CLAUDE.md 생성 | Claude Code 채팅 | "전역 CLAUDE.md 만들어주세요" |

---

### 2단계 — 프로젝트를 처음 받을 때 (프로젝트당 최초 1회)

새 프로젝트가 생기거나, 기존 프로젝트를 이 PC에서 처음 사용할 때 실행합니다.  
원하는 위치로 이동 후 실행하면 **폴더가 자동으로 생성**됩니다.

> 폴더 경로는 PC마다 달라도 됩니다. 드라이브명, 폴더명 무관합니다.  
> 예) `C:\ClaudeProjects\kws-portal` / `D:\Work\kws-portal` / `C:\Projects\kws-portal`

```bash
git clone https://github.com/kwsDeveloper/kws-project.git
git clone https://github.com/kwsDeveloper/kws-portal.git
```

> 이후 새 프로젝트가 추가될 때마다 해당 저장소 주소로 동일하게 실행합니다.

---

### 3단계 — 작업할 때마다 (매번)

**주 작업 PC (Claude Code 설치 PC)**

| 할 일 | 어디서 | 방법 |
|-------|--------|------|
| 포털 수정·문서 생성 등 | Claude Code 채팅 | 아래 요청 예시 참고 (자동 push까지 완료) |

**나머지 PC (최신 내용 받을 때)**

각 프로젝트 폴더 안에서 실행해야 합니다. (상위 폴더에서 실행하면 오류 발생)

```bash
cd 내폴더경로\kws-project
git pull
```
```bash
cd 내폴더경로\kws-portal
git pull
```

| 할 일 | 방법 |
|-------|------|
| PDF 필요할 때 | 탐색기에서 HTML 파일 더블클릭 → `Ctrl+P` → PDF로 저장 |

---

## Claude Code 요청 예시

### 포털 관리
| 요청 예시 |
|----------|
| "복지넷 링크 추가해주세요. URL은 www.bokjinet.or.kr" |
| "복지넷 링크 삭제해주세요" |
| "복지넷 링크를 비활성으로 변경해주세요" |
| "카테고리명 '복지' → '사회복지'로 변경해주세요" |

### 문서 생성
| 요청 예시 |
|----------|
| "인수인계 PDF 만들어주세요" |
| "사용 매뉴얼 PDF 만들어주세요" |

### 설정 변경
| 요청 예시 |
|----------|
| "조직명을 OO복지회로 변경해주세요" |
| "전체 폰트를 나눔고딕으로 변경해주세요" |

### 기타
| 요청 예시 |
|----------|
| "현재 링크 목록 보여주세요" |
| "포털 현재 상태 설명해주세요" |
| "GitHub에 올라간 파일 목록 알려주세요" |

---

## 비밀번호 분실 시 (포털)

Supabase 대시보드 → Table Editor → `config` 테이블 → `adminPw` 행 value 직접 수정  
→ https://supabase.com/dashboard/project/czrdvknzbkmryvnjyiki

---

## 문의

GitHub: https://github.com/kwsDeveloper
