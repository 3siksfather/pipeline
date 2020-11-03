node('maven') {
  stage('Maven Build') {
    sh " oc whoami"
    sh " pwd ; id;"
    git url: "https://github.com/3siksfather/simple"
    sh "cp configuration/settings.xml ~/.m2/"
    sh "mvn package"
    sh "ls  *"
  }
  stage('Test') {
    parallel(
      "Cart Tests": {
        sh "curl -s -X POST http://eap-app-jenkins.apps.ps.example.com/index.jsp"
      },
      "Discount Tests": {
        sh "curl -s -X POST http://eap-app-jenkins.apps.ps.example.com/failover.jsp"
      }
    )
  }
  stage('Build Image') {
    sh "oc start-build eap-app --from-file=target/ROOT.war --follow"
  }
 
//  stage('Deploy') {
//    sh "oc rollout latest dc/eap-app -n jenkins"
//  }
 
 
  stage('System Test') {
    sh " sleep 30"
    sh "curl -s http://eap-app-jenkins.apps.ps.example.com/index.jsp"
  }
}
