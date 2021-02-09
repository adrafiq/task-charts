{{/*
Expand the name of the chart.
*/}}
{{- define "swvl-api.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "swvl-api.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "swvl-api.labels" -}}
helm.sh/chart: {{ include "swvl-api.chart" . }}
{{ include "swvl-api.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Values.serviceName }}
service: {{ .Values.serviceName }}
{{- end }}
{{- if .Values.image.tag }}
version: {{ .Values.image.tag }}
{{- end }}
{{- if .Values.critical }}
critical: {{ .Values.critical }}
{{- end }}
{{- end }}





{{/*
Selector labels
*/}}
{{- define "swvl-api.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.serviceName }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
