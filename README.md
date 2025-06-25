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
7- --> export PATH="$JAVA_HOME/bin:$PATH:$HOME/.pub-cache/bin"  //copy and paste it in ~/.zshrc

=============== to generate injection.config.dart =============
1- --> dart run build_runner watch --delete-conflicting-outputs
2- --> build->flutter->buildApk(optional if the file is not generated after running the command line above)


=============== login service using retrofit ===========
1- --> add retrofit & retrofit generator 
2- --> add build_runner to generate  login_service.g.dart
3- --> dart run build_runner watch --delete-conflicting-outputs 

while making the response of login we should add json annotation & json_serializable 
1- add from & to Json  
2- -->  generate  login_response.g.dart
3- --> dart run build_runner watch --delete-conflicting-outputs 


===== for any response model you should use extensions so you can avoid nullable value 
1- ---> create extensions package >>> flutter create --template=package core/extensions
2- ---> after creating and handle nulls comming from api 

===== add connectivity plus =============================
1- add it in data package // to check if the user is using internet or not 
2- create connectivity_info.dart in network

===== adding base useCase in domain package & implement login use case
/////////// start of advanced handling for errors 
1- create error handler in data package contains (datasource , app_strings , status_codes ,response_message ,dio_error_handler, data_source_extension   )

===== Integrating sharedPreferences & Network di - the memory Nexus
1- add sharedPreferences package , injectable , build_runner in core/data package 
2- create data_module that will be sharable between all the app 
3- we add in data_module the important parameters that i want to share and the instance of dio that i will use to share with dio_factory
4- create app_preferences  in core/appstore package in provider directory 
!!!!! not all parms in the shared preferences(which user prefer : language , constants : base url ) but accessToken will be in session_provider.
5- we implement the preferences provider as setters & getters 
6- make preferences_strings for the keys  for removing any hard code
