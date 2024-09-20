//
//                  Simu5G
//
// Authors: Giovanni Nardini, Giovanni Stea, Antonio Virdis (University of Pisa)
//
// This file is part of a software released under the license included in file
// "license.pdf". Please read LICENSE and README files before using it.
// The above files and the present reference are part of the software itself,
// and cannot be removed from it.
//
package simu5g.stack.ip2nic;

//
// The IP2Nic module acts as a bridge between the IP network layer and the cellular (LTE/NR) protocol stack.
// It exhibits slightly different behavior when operating in the UE compared to the BS.
// Its main functionalities include:
// - Registering itself as an interface for accessibility from upper layers (e.g., IP Layer).
// - Adding control information to IP packets (5-tuple) in the downstream direction. Additionally, in the BS
//   module, it appends the destination ID to the control information to ensure packets are sent to the correct UE.
//
simple IP2Nic like INetworkLayer2CellularNic
{
    parameters:
        string nodeType;
        string interfaceTableModule;
        string interfaceName = default("cellular");
        string routingTableModule;
        @display("i=block/layer");
    gates:
        // Connection to the network layer.
        // These gate names are recognized by the network layer (same as those in the INetworkInterface interface).
        input upperLayerIn;
        output upperLayerOut;

        // Connection to the cellular stack.
        inout stackNic @labels(IPDatagram);
}
