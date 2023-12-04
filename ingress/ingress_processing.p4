/* the header we want to process in the ingress, the ones which will enter the pipeline */

//struct can contain any other type (e.g header) including structs too
struct ingress_headers_t{  //this ingress pipeline can process packets with any of the headers, all of them, o just one, or just two
    ethernet_t ethernet;
    vlan_tag_h vlan_tag;
    ipv4_h ipv4;
}


//intemediate results goes here
struct ingress_metadata_t{
    //in this case, None
}


