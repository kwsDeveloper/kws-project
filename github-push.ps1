param(
    [string]$ProjectName,
    [string]$RepoName
)

# RepoName 없으면 ProjectName 그대로 사용
if (-not $RepoName) { $RepoName = $ProjectName }

$path = "C:\ClaudeProjects\$ProjectName"

# 폴더가 없으면 자동 생성
if (-not (Test-Path $path)) {
    New-Item -ItemType Directory -Path $path | Out-Null
    Write-Host "📁 폴더 생성: $path" -ForegroundColor Yellow
}

cd $path
git init
git add .
git commit -m "첫 번째 커밋" --allow-empty
gh repo create $RepoName --public --source=. --remote=origin --push

Write-Host "✅ GitHub 업로드 완료!" -ForegroundColor Green
Write-Host "🔗 https://github.com/kwsDeveloper/$RepoName" -ForegroundColor Cyan