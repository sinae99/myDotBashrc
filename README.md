### Dotbashrc
--------------------------------------

minimal baseline tools



# Kubernetes command shortcuts
alias k="kubectl"
alias kg="kubectl get"
alias kgp="kubectl get pods"
alias kgn="kubectl get nodes"
alias kgd="kubectl get deployments"
alias kgs="kubectl get svc"

alias kd="kubectl describe"
alias kl="kubectl logs"

alias kaf="kubectl apply -f"
alias kdf="kubectl delete -f"

# Context and Namespace helpers
alias kctx="kubectl config use-context"
alias kns="kubectl config set-context --current --namespace"





# Docker IP Inspector
alias dip='docker ps -q | xargs docker inspect --format "{{.Name}} | Net:{{range $k,$v := .NetworkSettings.Networks}} {{$k}} | IP:{{$v.IPAddress}}/16 | GW:{{$v.Gateway}} | MAC:{{$v.MacAddress}}{{end}}"'


/usr/local/bin/dip




kg pods -A
kd pod mypod -n kube-system
kl mypod
dip
