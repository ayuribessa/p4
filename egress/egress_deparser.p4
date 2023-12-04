controll EgressDeparser(packet_out   pkt,
                        inout egress_headers_t    hdr,
                        in egress_metadata_t     meta,
                        in  egress_intrinsec_metadata_for_deparser_t  eg_dprsr_md
                        )
                        {
                            apply{pkt.emit(hdr);} //hdr is a empy struck(is empty on the egress_processing), so whats are coming out is the payload, that in this case is the packet
                        }