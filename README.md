# KWS Project — 공통 문서 허브

kwsDeveloper의 모든 프로젝트에서 공통으로 참고하는 가이드·문서 저장소입니다.

---

## 저장소 구성

| 저장소 | 용도 | 주소 |
|--------|------|------|
| **kws-project** (여기) | 공통 문서·가이드 허브 | github.com/kwsDeveloper/kws-project |

---

## PC 설정 가이드 (신규 추가 기준)

### 1단계 — PC를 처음 쓸 때 (최초 1회)

| 순서 | 할 일 | 어디서 | 명령 |
|------|-------|--------|------|
| 1 | GitHub CLI 설치 | Windows 터미널(cmd) | `winget install --id GitHub.cli` |
| 2 | GitHub 로그인 | Windows 터미널(cmd) | `gh auth login` |
| 3 | 기본 브랜치 설정 | Windows 터미널(cmd) | `git config --global init.defaultBranch main` |
| 4 | 전역 CLAUDE.md 생성 | Claude Code 채팅 | 아래 요청 문구 복사해서 입력 |

**4번 요청 문구 (복사해서 그대로 입력):**
> "전역 CLAUDE.md 만들어주세요. 아래 규칙을 포함해주세요:
> - 문서 파일명 형식: 제목_문서종류_YYYYMMDD (예: KWS업무포털_인수인계문서_20260830)
> - 문서는 HTML로만 저장, 생성 후 자동으로 git push까지 완료
> - 새 프로젝트 시작 시 GitHub 저장소 생성부터 자동 진행"

---

### 2단계 — 프로젝트 받기

> 폴더 경로는 PC마다 달라도 됩니다. 드라이브명, 폴더명 무관합니다.  
> clone 실행 시 폴더가 자동으로 생성됩니다.

#### 신규 PC에서 처음 받을 때

| 순서 | 할 일 | 명령 |
|------|-------|------|
| 1 | kws-project 먼저 clone | `git clone https://github.com/kwsDeveloper/kws-project.git` |
| 2 | 나머지 전체 자동 clone | kws-project 폴더 안의 **전체클론.bat 더블클릭** |

> 전체클론.bat는 이미 존재하는 폴더는 건너뛰므로 여러 번 실행해도 됩니다.

#### 새 프로젝트가 추가됐을 때

1. **생성하는 PC** (Claude Code + gh 로그인 완료된 PC): Claude Code 채팅에서 요청
   - "새 프로젝트 만들어주세요. 이름은 **kws-overtime** 입니다." → GitHub 저장소 생성 + push 자동 완료
   - 이름 없이 "새 프로젝트 만들어주세요."라고 하면 Claude가 이름을 되물어봄

2. **나머지 PC**: 전체클론.bat 더블클릭 또는 개별 clone
   ```bash
   git clone https://github.com/kwsDeveloper/kws-overtime.git
   ```

> ⚠️ git clone은 GitHub에 이미 있는 저장소만 가져올 수 있습니다. GitHub에 저장소가 없으면 "Repository not found" 오류가 납니다.

---

### 3단계 — 최신 내용 받기

**자동 (권장) — PC당 최초 1회 설정**

| 순서 | 할 일 |
|------|-------|
| 1 | `kws-project` 폴더 안의 **업데이트.bat 더블클릭** → 최신 파일 수신 |
| 2 | `kws-project` 폴더 안의 **시작프로그램등록.bat 더블클릭** → 자동 업데이트 등록 완료 |

→ 이후 PC를 켤 때마다 백그라운드에서 자동으로 최신 내용 수신 (창 뜨지 않음)

> 해제하려면 `kws-project` 폴더 안의 **시작프로그램해제.bat 더블클릭**

**수동 — 필요할 때 직접 실행**

`kws-project` 폴더 안의 **업데이트.bat 더블클릭**  
→ 모든 프로젝트 최신 파일 수신 (새로 추가된 파일 포함)

> ⚠️ **파일을 실수로 삭제한 경우** 업데이트.bat를 실행해도 복원되지 않습니다.  
> 터미널에서 아래 명령으로 복원하거나, kws-project 폴더를 삭제 후 재clone 하세요.
> ```bash
> git restore 파일명.bat
> ```

---

## CLAUDE.md 규칙 파일

Claude Code가 프로젝트 폴더를 열면 CLAUDE.md를 자동으로 읽어 규칙을 적용합니다. 별도로 실행하거나 호출할 필요 없습니다.

| 구분 | 위치 | 적용 범위 | GitHub 공유 |
|------|------|----------|------------|
| **전역** | `C:\Users\사용자명\.claude\CLAUDE.md` | 모든 프로젝트 | ❌ 각 PC에서 직접 생성 |
| **프로젝트별** | `프로젝트폴더\CLAUDE.md` | 해당 프로젝트만 | ✅ 자동 적용 |

| 할 일 | 채팅 요청 예시 |
|-------|--------------|
| 규칙 확인 | "현재 CLAUDE.md 내용 보여주세요" |
| 전역 규칙 추가 | "모든 프로젝트에서 이 규칙 써줘: ..." |
| 프로젝트 규칙 추가 | "이 규칙 기억해줘: ..." |

---

## Claude Code 요청 예시

작업할 프로젝트 폴더를 Claude Code에 연결한 후 채팅창에서 요청합니다.

| 방법 | 설명 |
|------|------|
| **방법 1** | Claude Code 실행 → 상단 경로 클릭 → 프로젝트 폴더 선택 |
| **방법 2** | 탐색기에서 프로젝트 폴더 열기 → 주소창에 `cmd` 입력 → `claude` 실행 |

> 예) 포털 작업 → `kws-portal` 폴더 / 문서 작업 → `kws-project` 폴더

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
| "인수인계 문서 만들어주세요" |
| "사용 매뉴얼 만들어주세요" |

> 생성된 문서는 프로젝트 폴더에 HTML로 저장되며 자동으로 GitHub에 push됩니다.  
> PDF가 필요하면 탐색기에서 HTML 파일 더블클릭 → `Ctrl+P` → PDF로 저장

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
