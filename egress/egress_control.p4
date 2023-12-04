control Egress(
    inout egress_headers_t    hdr,
    inout egress_metadata_t    meta,
    in egress_intrinsec_metadata_t   eg_intr_md,
    in egress_intrinsec_metadata_from_parser   eg_prsr_md,
    inout egress_intrinsec_metadata_for_deparser_t     eg_dprsr_md,
    inout egress_intrinsec_metadata_for_output_port_t     eg_oport_md
    ) {
        apply {} //do nothing
    }
