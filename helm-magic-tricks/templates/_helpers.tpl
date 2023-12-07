{{- define "EgressIPs.CreateNetNamespace" -}}
{{- $root := index . 0 }}

{{- range (index $root.Values "systems") }}
apiVersion: network.openshift.io/v1
kind: NetNamespace
metadata:
  name: {{ .name }}
netname: {{ .netname }}
netid: {{ .netid }}
egressIPs:
{{- range .egressIPs }}
- {{ . | toString -}}
{{ end }}
---
{{ end }}
{{ end }}
