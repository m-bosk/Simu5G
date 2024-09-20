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


package simu5g.stack;

import simu5g.stack.d2dModeSelection.D2DModeSelection;

//
// The LteNicEnbD2D module represents an LTE eNodeB network interface with
// support for D2D (Device-to-Device) communications. It extends the basic
// LteNicEnb module to manage D2D-capable UEs (User Equipments). A D2D mode
// selection algorithm can be specified using the 'd2dModeSelectionType'
// parameter.
//
module LteNicEnbD2D extends LteNicEnb
{
    parameters:
        LtePdcpRrcType = default("LtePdcpRrcEnbD2D");
        LteMacType = default("LteMacEnbD2D");
        LtePhyType = default("LtePhyEnbD2D");
        PacketFlowManagerType = default("PacketFlowManagerEnb");
        d2dCapable = true;
        string d2dModeSelectionType = default("D2DModeSelectionBase");

    submodules:
        d2dModeSelection: <d2dModeSelectionType> like D2DModeSelection {
            @display("p=623,314,row");
        }
}
