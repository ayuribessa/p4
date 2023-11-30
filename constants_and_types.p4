// bit is unsigned inter
typedef bit<48> mac_addr_t; // typedef : type alias
typedef bit<32> ipv4_addr_t; //typedef : type alias


// a set of named values for the type bit<16>
enum bit<16> ether_type_t {
    IPV4 = 0x800,
    ARP = 0x806,
    TPID = 0x8100,
    IPV6 = 0x86DD,
    MPLS = 0x8847
}

//Target  depended constants
#if __TARGET_TOFINO__ == 1
const PortId_t CPU_PORT = 64;   //PortId_t is a TNA-specific Typw
#elif __TARGET_TOFINO__ == 2;
const PortId_t CPU_PORT = 2;
#endif

//defining constants to be controllable from the compiler command line
#ifndef IPV4_HOST_SIZE
  #define IPV4_HOST_SIZE 13072
#endif

#ifndef IPV4_LPM_SIZE
  #define IPV4_HOST_SIZE 12288
#endif







