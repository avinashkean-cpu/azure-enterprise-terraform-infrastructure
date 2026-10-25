# ==============================================================================
# Enterprise GitHub Push Automation Script
# ==============================================================================
param (
    [string]$GitHubRepoUrl
)

$ErrorActionPreference = "Stop"

Write-Host "`n🚀 ================================================================" -ForegroundColor Cyan
Write-Host "   Enterprise GitHub Deployment & Push Tool" -ForegroundColor Cyan
Write-Host "================================================================`n" -ForegroundColor Cyan

# 1. Prompt for GitHub repository URL if not provided via parameter
if (-not $GitHubRepoUrl) {
    Write-Host "Please create a new empty repository on GitHub (without initializing README/license)." -ForegroundColor Yellow
    Write-Host "Example URL: https://github.com/<your-username>/azure-enterprise-terraform.git`n" -ForegroundColor Yellow
    $GitHubRepoUrl = Read-Host "Enter your GitHub Repository URL"
}

if (-not $GitHubRepoUrl) {
    Write-Host "❌ Error: GitHub Repository URL cannot be empty. Aborting." -ForegroundColor Red
    exit 1
}

# 2. Ensure we are in a Git repository
if (-not (Test-Path ".git")) {
    Write-Host "❌ Error: .git directory not found. Run this from the repository root." -ForegroundColor Red
    exit 1
}

# 3. Check current branch and ensure `main` exists and is active
Write-Host "📌 Checking Git branch state..." -ForegroundColor Green
$currentBranch = (git branch --show-current).Trim()
Write-Host "   Current branch: $currentBranch" -ForegroundColor Gray

if ($currentBranch -ne "main") {
    Write-Host "   Switching to 'main' branch..." -ForegroundColor Yellow
    git checkout -B main
}

# 4. Configure Remote URL (Set origin to GitHub)
Write-Host "`n🔗 Configuring remote origin to GitHub..." -ForegroundColor Green
$remotes = git remote
if ($remotes -contains "origin") {
    git remote set-url origin $GitHubRepoUrl
} else {
    git remote add origin $GitHubRepoUrl
}
Write-Host "   Origin remote successfully configured to: $GitHubRepoUrl" -ForegroundColor Gray

# 5. Stage all enterprise files
Write-Host "`n📦 Staging all files including .github workflows, docs, and modules..." -ForegroundColor Green
git add .

# 6. Commit changes
$commitMessage = "feat(platform): implement enterprise Azure Terraform architecture, GitOps CI/CD, and governance"
Write-Host "`n📝 Committing changes with Conventional Commit..." -ForegroundColor Green
git commit -m $commitMessage

# 7. Push to GitHub
Write-Host "`n🚀 Pushing code to GitHub (main branch)..." -ForegroundColor Green
git push -u origin main --force

Write-Host "`n================================================================" -ForegroundColor Cyan
Write-Host "🎉 SUCCESS! Your enterprise repository is live on GitHub!" -ForegroundColor Green
Write-Host "================================================================`n" -ForegroundColor Cyan
Write-Host "Next Steps:" -ForegroundColor Yellow
Write-Host "1. Open your repository on GitHub." -ForegroundColor White
Write-Host "2. Verify the README.md architecture diagram and badges." -ForegroundColor White
Write-Host "3. Follow 'profile-makeover/ENTERPRISE_GITHUB_CHECKLIST.md' to set up branch protection rules." -ForegroundColor White
