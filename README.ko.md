# hvai-python-template

[English README](README.md)

HVAI 팀 전체의 Python 개발 환경을 통일하기 위한 GitHub 템플릿 레포입니다.
모든 개발자가 이 템플릿으로 새 프로젝트를 시작하여 Python 버전과 패키지 버전을 동일하게 유지합니다.

---

## 개요

| 항목 | 값 |
|------|-----|
| **Python** | 3.10 |
| **PyTorch** | 2.9.1+cpu |
| **플랫폼** | Ubuntu 22.04+ / macOS / WSL2 |

---

## 템플릿 사용법

### 방법 1: GitHub 템플릿 사용 (새 프로젝트 시작 시 권장)

1. 이 레포 상단의 **"Use this template"** 버튼 클릭
2. **"Create a new repository"** 선택
3. 새 레포 이름 입력 후 **"Create repository"** 클릭
4. 새 레포를 clone하고 셋업 실행:

```bash
git clone git@github.com:<your-org>/<your-repo>.git
cd <your-repo>
bash setup_env.sh
```

### 방법 2: 직접 clone (빠른 테스트용)

```bash
git clone git@github.com:hypervisualai/hvai-python-template.git my-project
cd my-project
bash setup_env.sh
```

---

## 빠른 시작

```bash
# 1. 셋업 스크립트 실행 (최초 1회)
bash setup_env.sh

# 2. 가상환경 활성화
source .venv/bin/activate

# 3. 확인
python -c "import torch; print(torch.__version__)"
```

가상환경 활성화 없이 직접 실행:

```bash
./.venv/bin/python your_script.py
```

---

## 설치 패키지

| 패키지 | 버전 | 용도 |
|--------|------|------|
| **torch** | 2.9.1+cpu | PyTorch (CPU 전용) |
| **torchvision** | 0.24.1+cpu | 비전 유틸리티 |
| **torchaudio** | 2.9.1+cpu | 오디오 유틸리티 |
| numpy | 2.2.6 | 수치 연산 |
| scipy | 1.15.3 | 과학 연산 |
| opencv-python | 4.13.0.90 | 이미지 처리 |
| matplotlib | 3.10.8 | 시각화 |
| pytest | 9.0.2 | 테스트 |
| expecttest | 0.3.0 | 테스트 어서션 |

---

## 패키지 추가 방법

1. `requirements.txt`에 패키지 추가:

```
your-package==1.2.3
```

2. 설치:

```bash
./.venv/bin/pip install -r requirements.txt
```

3. 팀원 모두가 동일한 버전을 사용하도록 `requirements.txt` 커밋:

```bash
git add requirements.txt
git commit -m "Add your-package"
```

---

## 사전 준비 (Python 3.10 설치)

### Ubuntu 22.04+ / WSL2

```bash
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.10 python3.10-venv python3.10-dev
```

### macOS

```bash
brew install python@3.10
```

---

## 프로젝트 구조

```
your-project/
├── .venv/              ← 가상환경 (git 제외)
├── .gitignore
├── .python-version     ← Python 버전 고정
├── requirements.txt    ← 패키지 버전 고정
├── setup_env.sh        ← 최초 1회 실행 셋업 스크립트
└── 소스코드...
```
