package test_nometadata_v1

policyID := "P123456"

violation contains {"msg": msg} if {
	msg := "some message"
}
