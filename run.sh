echo "-- Port forwarding ArgoCD / Alertmanager / Falcosidekick --"
microk8s kubectl port-forward svc/argocd-server -n argocd 8080:443 &
microk8s kubectl port-forward -n monitoring service/monitoring-prometheus-alertmanager 9093:80 &
microk8s kubectl port-forward -n monitoring service/monitoring-falcosidekick 2801:2801 &
microk8s kubectl port-forward -n monitoring service/monitoring-falcosidekick-ui 2802:2802 &

echo "-- Get ArgoCD Password --" &
microk8s kubectl get secret -n argocd argocd-initial-admin-secret -o yaml &

echo -e "\033[0;31mLink for ArgoCD UI https://localhost:8080 (credentials are admin\033[0m" &
echo -e "\033[0;31mLink for Falcosidekick UI http://localhost:2802/ui\033[0m" &
echo -e "\033[0;31mLink for Alertmanager UI http://localhost:9093/ui\033[0m"
