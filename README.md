# movie_clean_architecture_modules

A new Flutter project.

## Getting Started

1- create directory --> mkdir core

2- --> cd core

3- --> flutter create --template=package enter_module_name_here
3- --> flutter create --template=package data

============= OR ============== 
Lect-6-How-to-create-a-Module

1- --> flutter create --template=package core/data
2- --> flutter create --template=package core/domain
3- --> flutter create --template=package core/presentation
4- --> flutter create --template=package core/utils

install melos :
1- --> flutter pub add melos
2- --> dart pub global activate melos
3- --> export PATH="$PATH":"$HOME/.pub-cache/bin"
4- --> dart pub outdated
5- --> dart pub upgrade --major-versions
6- --> open ~/.zshrc
7- --> export PATH="$JAVA_HOME/bin:$PATH:$HOME/.pub-cache/bin"