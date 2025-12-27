# METADATA
# title: The title
# description: The description
# custom:
#   matchers:
#     namespaces:
#     - dev
#     - stage
#     - prod
package test_partialmetadata_v1

policyID := "P123456"

violation contains {"msg": msg} if {
	msg := "some message"
}
