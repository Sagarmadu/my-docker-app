name 'docker_myapp'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures a docker container'
long_description 'Installs/Configures docker container'
version '0.1.0'
issues_url 'https://github.com/learn-chef/learn_chef_apache2/issues' if respond_to?(:issues_url)
source_url 'https://github.com/learn-chef/learn_chef_apache2' if respond_to?(:source_url)

depends 'docker'
