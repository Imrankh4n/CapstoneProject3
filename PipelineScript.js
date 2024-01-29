pipeline {
agent any
tools {
terraform 'Terraform'
}

stages {
stage('Checkout') {
steps {
	checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '4c3a5f95-8d90-440d-819d-f12e2ae1494d', url: 'https://github.com/Imrankh4n/CapstoneProject3']])
	}

}

stage('Terraform init') {
steps {
sh 'terraform init'
}
}

stage('Terraform apply') {
steps {
sh 'terraform apply --auto-approve'
}
}
}
}
