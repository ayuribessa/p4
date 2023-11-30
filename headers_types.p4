/* são tipos compostos */
//contém tipos definidos em constants_and_types dentro deles
header ethernet_h {
    mac_addr_t dst_addr; 
    mac_addr_t src_addr;
    ether_type_t ether_type;
}

header vlan_tag_h{
    bit<3> pcp;
    bit<1> dei;
    bit<12> vid;
    ether_type_t ether_type;
}

header ipv4_h {
    bit<4> version;
    bit<4> ihl;
    bit<8> diffserv;
    bit<16> total_len;
    bit<16> identification;
    bit<3> flag;
    bit<13> frag_offset;
    bit<8> ttl;
    bit<8> protocol;
    bit<16> hdr_checksum;
    ipv4_addr_t src_addr;
    ipv4_addr_t dst_addr;
}