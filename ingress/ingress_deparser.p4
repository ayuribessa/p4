//deparsing is represented using a control
//the purpose is output valid packet headers in the corret order
control IngressDeparser(packet_out pkt,
                        inout ingress_headers_t hdr, // user defined
                        in ingress_medatada_t meta, //user defined
                        in ingress_intrinsic_metadata_for_deparser_t ig_dprsr_md //intrinsic
                        )
                        {
                            apply {
                                //this is a typical order of these headers
                                pkt.emit(hdr.ethernet); //the emit method of the packet_out extern, if the headers is valid, output it to the bytestream, otherwise, skip and do nothing
                                pkt.emit(hdr.vlan_tag);
                                pkt.emit(hdr.ipv4);
                                
                            }
                            //we created a struct ingress_headers_t with the headers in the same orders as above, so we can rewrite the above code as:
                            // pkt.emit(hdr);



                        }