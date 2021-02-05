Ansible Role: Jenkins Slave - Windows
=========

[![Build Status](https://travis-ci.org/mattandes/ansible-role-jenkins_slave_win.svg?branch=master)](https://travis-ci.org/mattandes/ansible-role-jenkins_slave_win)

Configures a Jenkins Windows slave utilizing the agent.jar file from the Jenkins master. This role will create a Windows service using NSSM to manage and automatically run the agent.jar file on startup.

Requirements
------------

* Administrator access on the Windows slave node
* A running Jenkins master (Role defaults to assuming this is running at http://localhost:8080)
* The Windows slave node defined in the Jenkins node section with the name defined in `jenkins_slave_node_name` (defaults to `{{ ansible_hostname | lower }}`)

Role Variables
--------------

Available variables are listed below, along with default values (see `defaults/main.yml`):

    jenkins_slave_win_user: jenkins

The Windows user that the Jenkins slave should run as.

    jenkins_slave_win_password: jenkins

The password for the Windows user that the Jenkins slave will run as.

    jenkins_slave_win_create_user: true

Determines whether the specified Jenkins user should be created as a local Windows user account.

    jenkins_slave_win_dir: "C:\\Jenkins"

The directory that the Jenkins slave should use for its work. Ideally this should match the `Remote root directory` setting in the node's configuration on the Jenkins master. This directory will be created if it doesn't exist already

    jenkins_slave_win_jenkins_url: http://localhost:8080

The URL for the Jenkins master that this slave should be connecting to. The role expects the node to already be defined on the master, preferably via the [JSasC](https://github.com/jenkinsci/configuration-as-code-plugin) plugin.

    jenkins_slave_win_jenkins_user: admin

The user to connect to the Jenkins master with to retrieve the node's secret. Should be an account that is able to manage the nodes section.

    jenkins_slave_win_jenkins_password: admin

The password for the user to connect to the Jenkins master as.

    jenkins_slave_win_java_args: "-Xmx768m"

Variable used to pass additional Java arguments to the slave agent process when it starts up.

    jenkins_slave_node_name: "{{ ansible_hostname | lower }}"

The Windows node name used in the Jenkins nodes.

Dependencies
------------

None.

Example Playbook
----------------

    - hosts: jenkins-slaves-win
      become: yes
      vars:
        jenkins_slave_win_jenkins_url: "http://jenkins:8080"
      roles:
         - role: mattandes.jenkins_slave_win

License
-------

MIT
