# prow-plugin-pingpong

This is a [Prow](https://github.com/kubernetes/test-infra/tree/master/prow) [external-plugin](https://github.com/kubernetes/test-infra/tree/master/prow/plugins#external-plugins) sample. if you commented `/ping` on Github, Prow bot reply `pong`.

![](https://raw.githubusercontent.com/bells17/prow-plugin-pingpong/master/how-to-use.png)

You can learn about Prow external-plugin from below links:

- [about external plugin](https://github.com/kubernetes/test-infra/tree/master/prow/plugins#external-plugins)
- [In-tree plugins](https://github.com/kubernetes/test-infra/tree/master/prow/plugins)
- [official external-plugins](https://github.com/kubernetes/test-infra/tree/master/prow/external-plugins)

Docker image is here: https://hub.docker.com/repository/docker/bells17/pingpong

## Deploy plugin

```
$ kubectl apply -f https://raw.githubusercontent.com/bells17/prow-plugin-pingpong/master/deploy.yaml
```

(Before deploying this plugin, you need a deployed Prow)

## Enable plugin

Append a below setting to `plugins.yaml`.

```
external_plugins:
  <org>/<repo>:
  - name: pingpong
    endpoint: http://pingpong.default.svc.cluster.local:8888
    events:
    - issue_comment
```

And apply this settings as below:

```
$ kubectl create configmap plugins \
	--from-file=plugins.yaml=plugins.yaml --dry-run -o yaml \
	| kubectl replace configmap plugins -f -
```
