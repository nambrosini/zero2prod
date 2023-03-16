{{- define "app_name" }}
{{ default .Chart.Name .Values.name}}
{{- end }}
