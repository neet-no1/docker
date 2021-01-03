#!/bin/bash
#set -x

init_intall() {
    echo init

}

update_git_repo () {
    echo update git repo

    REPO_URL=$1
    REPO_BASE_DIR=.
    REPO_DIR=$2

    echo repository name: [$REPO_DIR]

    if [ -d $REPO_DIR ];
    then
        echo exist repository
        echo skip
    else
        echo nothing repository
        git clone $REPO_URL $REPO_DIR
	sudo chown -R 33 wordpress_src/
    fi;
}

update_all_github_repo() {
    echo update all git repo
    echo update_git_repo "https://github.com/WordPress/WordPress.git" "wordpress_src"
    update_git_repo "https://github.com/WordPress/WordPress.git" "wordpress_src"
}

main() {

    init_intall
    update_all_github_repo

    docker-compose down
    
    cd mariadb
    docker build -t neet-mariadb .

    cd ..
    cd wordpress
    docker build -t neet-wordpress .

    cd ..
    docker-compose up -d
    
    sleep 10; docker exec -it wordpress_db_1 /usr/bin/db_setup.sh
}

main "$@"
