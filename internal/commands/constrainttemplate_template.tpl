# This is a custom template for a constraint template
apiVersion: templates.gatekeeper.sh/v1
kind: ConstraintTemplate
metadata:
  name: {{ .Name }}
spec:
  crd:
    spec:
      names:
        kind: {{ .Kind }}
      {{- if .AnnotationParameters }}
      validation:
        openAPIV3Schema:
          properties: {{- .AnnotationParameters | toJSON | fromJSON | toIndentYAML 2 | nindent 12 }}
      {{- end }}
  targets:
  {{- if eq .Version.String "v1" }}
  - code:
    - engine: Rego
      source:
        libs: {{- range .Dependencies }}
        - |- {{- stripV1Imports . | nindent 10 -}}
        {{ end }}
        rego: |- {{- .SourceV1 | nindent 10 }}
        version: v1
    target: admission.k8s.gatekeeper.sh
  {{- else }}
  - libs: {{- range .Dependencies }}
    - |- {{- . | nindent 6 -}}
    {{ end }}
    rego: |- {{- .Source | nindent 6 }}
    target: admission.k8s.gatekeeper.sh
  {{- end }}
