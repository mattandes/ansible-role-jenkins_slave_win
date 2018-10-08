set JENKINS_DIR={{ jenkins_slave_win_dir }}

java {{ jenkins_slave_win_java_args }} -jar agent.jar -jnlpUrl {{ jenkins_slave_win_jenkins_url }}/computer/{{ ansible_hostname | lower }}/slave-agent.jnlp -secret {{ jenkins_slave_win_agent_secret.content }} -workDir %JENKINS_DIR%