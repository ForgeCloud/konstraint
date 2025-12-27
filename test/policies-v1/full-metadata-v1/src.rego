# METADATA
# title: The title v1
# description: The description for v1 policy
# custom:
#   parameters:
#     super:
#       type: string
#       description: |-
#         super duper cool parameter with a description
#         on two lines.
#   matchers:
#     excludedNamespaces:
#     - kube-system
#     - gatekeeper-system
#     kinds:
#     - apiGroups:
#       - ""
#       kinds:
#       - Pod
#     - apiGroups:
#       - apps
#       kinds:
#       - DaemonSet
#       - Deployment
#       - StatefulSet
#     labelSelector:
#       matchExpressions:
#       - key: foo
#         operator: In
#         values:
#         - bar
#         - baz
#       - key: doggos
#         operator: Exists
#     namespaces:
#     - dev
#     - stage
#     - prod
package test_fullmetadata_v1

policyID := "P654321"

violation contains {"msg": msg} if {
    msg := "violation message"
}
