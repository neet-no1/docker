@echo off

call :init_install
call :update_all_git_repo

exit /b

:init_install
echo init
exit /b

:update_all_git_repo
echo update all git repo
call :update_git_repo "https://github.com/WordPress/WordPress.git" wordpress_src
exit /b

:update_git_repo
echo update git repo
set REPO_URL=%~1
set REPO_BASE_DIR=.
set REPO_DIR=%~2

IF EXIST "%REPO_DIR%\" (
    echo exist repository
    echo skip
) ELSE (
    echo nothing repository
    git clone %REPO_URL% %REPO_DIR%
)

docker-compose down

cd mariadb
docker build -t neet-mariadb .

cd ..
cd wordpress
docker build -t neet-wordpress .

cd ..
docker-compose up -d

timeout /t 10 > nul

docker exec -it wordpress_db_1 /usr/bin/db_setup.sh

pause

exit /b
