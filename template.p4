/* -*- P4_16 -*- */

#include <core.p4>
#include <tna.p4>

/* constants and types  */


/* headers definitions */


/* ingress pipeline */
struct ingress_headers_t {}
struct ingress_medatada_t {}

parser  IngressParser()  {}

control Ingress() {}
control IngressDeparser() {}

/* egress pipeline */
struct egress_headers_t {}
struct egress_metadata_t {}

parser EgressParser (){}
control Egress(){}
control EgressDeparser(){}


/**** FINAL PACKAGE *****/

Pipeline(
    IngressParser(), Ingress(), IngressDeparser(), EgressParser(), Egress(), EgressDeparser()
) pipe;

Switch(pipe) main;

