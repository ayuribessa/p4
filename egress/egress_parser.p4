parser EgressParser(packet_in pkt,
                    out egress_headers_t hdr,
                    out egress_metadata_t meta,
                    out egress_intrinsec_metadata_t eg_intr_md
                    )
                    {
                        state start {pkt.exact(eg_intr_md); transition accept;} //here, even if we our packet has ethernet, vlan ou ipv4 header, it will be passed in the egressParser
                        //so,if we do not parse them, they will be considered payload
            
                    }