//writen as a state machine. The states are Start, Accept and Reject. they start with Start
//inside the states we do some actions, using them like functions


//the directions are specified (in/out)) 
parser IngressParser(packet_in pkt, 
                    out ingress_headers_t hdr, //my own types here
                    out ingress_metadata_t meta, //my own types here
                    out ingress_intrinsic_metadata_t ig_intr_md) //have to create. this and the port_metadata_state in line 18 are prepend to the ingress packet
{

    //PARSERS

    //the start state is whre we start the parsing
    //Mandatory code
    state start {
        pkt.extract(ig_intr_md);
        pkt.advance(PORT_METADATA_SIZE); //skiping bytes that we do not have to worry right now
        transition parse_ethernet; //skip to the other state, the one with to header we want to parse

    }

    state parse_ethernet{
        pkt.extract(hdr.ethernet); //extract ethernet, put the bytes in the header we defined in the other file, set's the header to be values
        transition select (hdr.ethernet.ether_type){ //check de value of the ether_type
            ether_type_t.TPID: parse_vlan_tag;
            ether_type_t.IPV4: parse_ipv4;
            default: accept;
        }

    }

    state parse_vlan_tag{
        pkt.extract(hdr.vlan_tag);
        transition select(hdr.vlan_tag.ether_type){
            ether_type_t.IPV4: parse_ipv4;
            default: accept;
        }
    }

    state parse_ipv4{
        pkt.extract(hdr.ipv4);
        transition accept;
    }

}

//next: define the processing algorithm, writing the ingress control: ingress_control.p4