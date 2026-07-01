@echo off
REM AI Tools 站点 - GitHub 推送脚本
REM 使用方法：
REM 1. 编辑此文件，将 YOUR_GITHUB_TOKEN 替换为你的 GitHub Personal Access Token
REM 2. 双击运行此脚本

cd /d D:\game_test\aitools

echo.
echo ================================
echo AI Tools 站点 - Git 推送
echo ================================
echo.

REM 检查 token 是否配置
if "%1"=="" (
    echo 使用方法：
    echo push_to_github.bat ^<your_github_token^>
    echo.
    echo 或者编辑此文件，设置 GITHUB_TOKEN 环境变量
    goto end
)

set GITHUB_TOKEN=%1

echo 正在推送到 GitHub...
git push https://Tothvillar:%GITHUB_TOKEN%@github.com/Tothvillar/aitools.git main

if %errorlevel% equ 0 (
    echo.
    echo ================================
    echo 推送成功！
    echo.
    echo 请在 GitHub 仓库设置中启用 GitHub Pages：
    echo https://github.com/Tothvillar/aitools/settings/pages
    echo.
    echo 站点将在几分钟内发布在：
    echo https://tothvillar.github.io/aitools/
    echo ================================
) else (
    echo.
    echo 推送失败，请检查 token 是否正确
)

:end
pause
