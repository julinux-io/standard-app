{{/* vim: set filetype=mustache: */}}

{{/*
Outputs a reference to an Image
*/}}
{{- define "util.v1.extra.image_ref" -}}
"{{ .registry }}{{ required "image.repository must be set" .repository }}:{{ .tag | default "latest" }}"
{{- end -}}

{{/*
Outputs a resources block if the passed resources are set
*/}}
{{- define "util.v1.extra.resources" -}}
{{ if . }}
resources:
{{ toYaml . | indent 2 }}
{{ end }}
{{- end -}}

{{/*
Output command and args blocks if they are set
*/}}
{{- define "util.v1.extra.command_and_args" -}}
{{ if .command }}
command:
{{ toYaml .command | indent 2 }}
{{ end }}
{{ if .args }}
args:
{{ toYaml .args | indent 2 }}
{{ end }}
{{- end -}}

{{/*
Output affinity block if set
*/}}
{{- define "util.v1.extra.affinity" -}}
{{ if . -}}
affinity:
{{ toYaml . | indent 2 }}
{{- end -}}
{{- end -}}

{{/*
Output tolerations block if set
*/}}
{{- define "util.v1.extra.tolerations" -}}
{{ if . -}}
tolerations:
{{ toYaml . | indent 2 }}
{{- end -}}
{{- end -}}