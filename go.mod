module github.com/bells17/prow-plugin-pingpong

go 1.13

// https://github.com/kubernetes/test-infra/blob/c628c3674eb0c9292812d760232afcdbb7c79c99/go.mod
replace (
	cloud.google.com/go => cloud.google.com/go v0.44.3
	k8s.io/api => k8s.io/api v0.0.0-20190918195907-bd6ac527cfd2
	k8s.io/apiextensions-apiserver => k8s.io/apiextensions-apiserver v0.0.0-20190918201827-3de75813f604
	k8s.io/apimachinery => k8s.io/apimachinery v0.0.0-20190817020851-f2f3a405f61d
	k8s.io/client-go => k8s.io/client-go v0.0.0-20190918200256-06eb1244587a
	k8s.io/code-generator => k8s.io/code-generator v0.0.0-20190612205613-18da4a14b22b
)

require (
	github.com/sirupsen/logrus v1.4.2
	k8s.io/test-infra v0.0.0-20191225070530-c628c3674eb0
)
