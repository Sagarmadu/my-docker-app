# learn_chef_apache2

## Introduction:

This cookbook is for building a docker image for deploying a sample war file into apache-tomcat and creating a container using the image. The application uses mysql as database.

## Cookbook dependencies:
 - This cookbook depends on the community `docker` cookbook for managing docker images and the containers.

## Usage:
 - Add `depends docker_myapp` in target cookbook metadata.rb
 - Add `include_recipe docker_myapp:default` in default recip


## Kitchen Test:
  - Used kitchen and vagrant tools for testing the cookbook.
    `kitchen converge` (create, converge, destroy, list)

## Dockerfile:

 Docker can build images automatically by reading the instructions from a Dockerfile.

 Below are the instructions mentioned in our Dockerfile:
 1. Base image as ubuntu:16.04
 2. Installs Oracle Java 8
 3. Installs mysql-server-5.7 and Configures 'root' user (with password as 'root')
 4. Loads the DB shema into a 'test' database.
 5. Configures apache-tomcat-8.0.1
 6. Copies all the build context files i.e app.war, data.sql and mysql_import_schema.sh
 7. Start tomcat server

## Test app deployment:

 - curl http://localhost:8080/loginMysql/
