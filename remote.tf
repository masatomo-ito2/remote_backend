terraform {
	backend "remote" {
		organization = "masa_org"

		workspaces {
			prefix = "jenkins_pipeline_"
		}
	}
}
