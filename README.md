# Simple News App with Unit and Bloc testing

A Demo Flutter project with Unit and Bloc Testing which parses data from NewsApi

## Getting Started

# Project Setup

I have tried to follow TDD architectire for the project for better redability and better management

Firstly I installed the packages and plugins which I'm going to use most in this project, the packaces are added throughout the development phase according to the needs of application.

The main packages and plugins installed are follows

1. Bloc - For state management<br/> 2. Dio - For api calls<br/> 3. ohters for code generations and some other suffs<br/>

The project is divided into 4 parts<br/> 1. App Setup<br/> 2. Application<br/> 3. Infrastructure<br/> 4. Presentation<br/>

# App Setup

The App setup consists of Api services, Local storage services , bloc observer for observing bloc states and event and app.dart which is beginning of our application.

# Infrastructure

The Infrastructure consits of Repository classes for api, local storage , Models of api etc.

# Application

The Application is used to call repository which consists of bloc, api failure entites and api endpoints.

# Presentation

The presentaion consists of User Interface section of the application. All the screens and widgets are located in presentation.


# Install Guides

To build the project you need to clone the project using git clone https://github.com/gautamswostik/working-with-map-in-flutter.git<br/> When Project is cloned goto the project and enter flutter pub get in your terminal to get all the packages<br/>If there are no error you can build the project using command flutter buil apk --release in termimal <br/> After project is built click the link in terminal and goto apk location then copy apk to your mobile phone then install in your phone

# Versions

Dart 2.16.1<br/>
Flutter Flutter 2.10.2<br/>
