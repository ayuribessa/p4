/********** match-action tables ************/

control Ingress(
    //user defined, in the ingress_processing.p4  file
    inout ingress_headers_t hdr,
    inout ingress_metadata_t meta,
    //Intrinsic

    in ingress_intrinsic_metadata_t ig_intr_md, //in means that are pre-initialize by the hardware, defined by the architecture
    in ingress_intrinsic_metadata_from_parser_t ig_prsr_md,
    inout ingress_intrinsic_metadata_for_deparser_t ig_dprsr_md,
    inout ingress_intrinsic_metadata_for_tm_t ig_tm_md //intrinsic metadata for the traffic manager
)
{
    /*Two section, one with the tables and actions, and other where we define the processing algorithm */
    /*section 1: Define Variables, actions and tables*/

     /* ACTIONS */
    //sintaxe of actions is like a function
    action send(PortId_t port){  //portId_t is defined in the constants_types.p4
        ig_tm_md.ucast_egress_port = port; //assgin this value in the TNA instrinsi metadata ucast_egress_port,
        //when the packet reaches the traffic manager, the fix function component, will forward the packet to the specified port
    }

    action drop(){
        ig_dprsr_md.drop_ctl = 1; //when the packet reaches the deparser, it will be dropped

    }
    /* TABLES */
    table ipv4_host{
        key = {
            hdr.ipv4.dst_addr: exact;
        }
        actions = {
            send;
            drop;
            //there is no default action, so, if there is no match the action will be a standardized one, called NoAction, tha means do nothing
        }
        size = IPV4_HOST_SIZE
    }

    table ipv4_lpm {
        key = {
            hdr.ipv4.dst_addr: lpm;
        }
        actions = {
            send;
            drop;
        }

        default_action = send(CPU_PORT);
        size = 12288;
    }

    /* Section 2: defining the processing algorith */
    apply {
        //operate only on the valid headers, so use the special statement to check that
        if (hdr.ipv4.isValid()){
        //we call the table with a method apply. the result here will be hit or miss. Here If the first tables get a miss, we apply the second table
        if (ipv4_host.apply().miss){ //table.apply(): peform the match-action processing on the table
            ipv4_lpm.apply();
            }
        } 
    }
}

// Here, if the packet doesn't have an ipv4 header, it will do nothing, beacause there is no statement for that





}



)