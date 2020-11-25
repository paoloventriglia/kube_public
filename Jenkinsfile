pipeline {
    agent any
    stages {
        stage('Plan') {
            steps {
                sh 'ci/plan.sh'
            }
        }
        stage('Apply') {
            steps {
                sh 'ci/apply.sh'
            }
        }
        stage('Deploy_App') {
            steps {
                sh 'ci/deploy_app.sh'
            }
        }
    }
}